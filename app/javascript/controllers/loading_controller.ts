import { Controller } from "@hotwired/stimulus";

import { getComponentControllerForElement } from "../helpers";

export interface LoaderController extends Controller {
  toggle(): void;
  show(): void;
  hide(): void;
}

export default class extends Controller {
  static targets = ["loader"];

  loaderTargets: HTMLElement[];

  toggle() {
    this.loaderTargets.forEach(target => {
      const controller = this.getLoaderControllerForElement(target);
      if (controller) {
        controller.toggle();
      }
    });
  }

  start() {
    this.loaderTargets.forEach(target => {
      const controller = this.getLoaderControllerForElement(target);
      if (controller) {
        controller.show();
      }
    });
  }

  stop() {
    this.loaderTargets.forEach(target => {
      const controller = this.getLoaderControllerForElement(target);
      if (controller) {
        controller.hide();
      }
    });
  }

  private getLoaderControllerForElement(
    element: HTMLElement,
  ): LoaderController | null {
    const controller = getComponentControllerForElement(this, element);
    if (controller) {
      return controller as unknown as LoaderController;
    }
    return null;
  }
}
