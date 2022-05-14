import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="<%= @attribute %>"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }
}
