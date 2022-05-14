import { Controller } from "@hotwired/stimulus";
import invariant from "tiny-invariant";
import PerfectScrollbar from "perfect-scrollbar";

export default class extends Controller {
  scrollbar?: PerfectScrollbar;

  connect() {
    // Initialize scrollbar on element
    invariant(this.element instanceof HTMLElement);
    this.element.style.position = "relative";
    this.scrollbar = new PerfectScrollbar(this.element);
  }

  disconnect() {
    if (this.scrollbar) {
      this.scrollbar.destroy();
    }
  }
}
