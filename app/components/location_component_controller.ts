import { Controller } from "@hotwired/stimulus";
import type { Map, Marker } from "mapbox-gl";
import invariant from "tiny-invariant";

import { resolve } from "app/javascript/helpers";

export default class extends Controller {
  static targets = ["map"];

  mapTarget: HTMLElement;
  lngLat?: mapboxgl.LngLat;
  map?: Map;
  marker?: Marker;

  connect() {
    invariant(this.element instanceof HTMLElement);
    const { location } = this.element.dataset;
    if (location) {
      const lngLatText = resolve(() => {
        const matches = /^POINT \((.*)\)$/.exec(location);
        invariant(
          matches && matches[1],
          "failed to parse WKT (expected a valid POINT)",
        );
        return matches[1];
      });
      const [lng, lat] = lngLatText.split(" ").map(parseFloat);
      this.lngLat = new mapboxgl.LngLat(lng, lat);
      this.mapSet();
    }
  }

  mapTargetConnected(target: HTMLElement) {
    if (this.map) {
      this.map.remove();
    }
    this.map = new mapboxgl.Map({
      container: target,
      style: "mapbox://styles/mapbox/streets-v11",
      center: this.lngLat || [-79.402593, 43.671732],
      zoom: 12,
      interactive: false,
    });
    this.map.once("load", () => {
      this.mapLoaded();
      this.mapSet();
    });
  }

  mapLoaded() {
    this.dispatch("loaded");
  }

  mapSet() {
    if (this.map && this.lngLat) {
      this.map.setCenter(this.lngLat);
      if (this.marker) {
        this.marker.remove();
      }
      this.marker = new mapboxgl.Marker()
        .setLngLat(this.lngLat)
        .addTo(this.map);
    }
  }

  mapTargetDisconnected() {
    if (this.map) {
      this.map.remove();
    }
  }
}
