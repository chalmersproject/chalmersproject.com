import { Xt } from "xtendui";
import { Controller } from "@hotwired/stimulus";

import type { LoaderController } from "app/javascript/controllers/loading_controller";

const animationDuration = 500;

export default class extends Controller implements LoaderController {
  static targets = ["overlay"];

  overlayTarget: HTMLElement;

  toggle() {
    if (this.overlayTarget.classList.contains("on")) {
      this.hide();
    } else {
      this.show();
    }
  }

  show() {
    Xt.on({ el: this.overlayTarget, duration: animationDuration });
  }

  hide() {
    Xt.off({ el: this.overlayTarget, duration: animationDuration });
  }
}
