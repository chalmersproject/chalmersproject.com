import { Application } from "@hotwired/stimulus";
import { meta } from "app/javascript/meta";

// Initialize application
const application = Application.start();

// Configure Stimulus development experience
window.Stimulus = application;
window.Stimulus.debug = meta("env") === "development";

export { application };
