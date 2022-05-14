import type { Application } from "@hotwired/stimulus";

declare global {
  const Stimulus: Application;

  interface Window {
    Stimulus: Application;
  }
}
