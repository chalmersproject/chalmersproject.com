import { Controller } from "@hotwired/stimulus";
import type { Map, Marker } from "mapbox-gl";
import invariant from "tiny-invariant";

import { resolve } from "app/javascript/helpers";

export default class extends Controller {
  static targets = ["field", "map"];

  fieldTarget: HTMLInputElement;
  mapTarget: HTMLElement;

  map?: Map;
  marker?: Marker;
  ctrlKeyPressed = false;
  metaKeyPressed = false;

  initialize() {
    document.addEventListener("keydown", event => {
      this.ctrlKeyPressed = event.ctrlKey;
      this.metaKeyPressed = event.metaKey;
      this.mapSetCursor();
    });
    document.addEventListener("keyup", event => {
      this.ctrlKeyPressed = event.ctrlKey;
      this.metaKeyPressed = event.metaKey;
      this.mapSetCursor();
    });
  }

  connect() {
    const valueText = this.fieldTarget.value;
    const value = resolve(() => {
      if (valueText) {
        const lngLatText = resolve(() => {
          const matches = /^POINT \((.*)\)$/.exec(valueText);
          invariant(
            matches && matches[1],
            "failed to parse WKT (expected a valid POINT)",
          );
          return matches[1];
        });
        const [lng, lat] = lngLatText.split(" ").map(parseFloat);
        return new mapboxgl.LngLat(lng, lat);
      }
    });

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v11",
      center: value || [-79.402593, 43.671732],
      zoom: 11,
      cooperativeGestures: true,
    })
      .addControl(
        new MapboxGeocoder({
          mapboxgl,
          accessToken: mapboxgl.accessToken,
          marker: false,
        }),
      )
      .once("load", () => {
        this.mapLoaded();
        if (value) {
          this.mapSetMarker(value);
        }
      })
      .on("click", event => this.mapClicked(event));
  }

  mapLoaded() {
    this.mapSetCursor();
    this.dispatch("loaded");
  }

  mapClicked(event: mapboxgl.MapMouseEvent) {
    this.mapSetMarker(event.lngLat);
    this.fieldTarget.value = `POINT (${event.lngLat.toArray().join(" ")})`;
  }

  mapSetMarker(lngLat: mapboxgl.LngLat) {
    if (this.marker) {
      this.marker.remove();
    }
    if (this.map) {
      this.marker = new mapboxgl.Marker().setLngLat(lngLat).addTo(this.map);
    }
  }

  mapSetCursor() {
    if (this.map) {
      const container = this.map.getCanvasContainer();
      container.style.cursor =
        this.ctrlKeyPressed || this.metaKeyPressed ? "grab" : "crosshair";
    }
  }

  disconnect() {
    if (this.map) {
      this.map.remove();
    }
  }
}
