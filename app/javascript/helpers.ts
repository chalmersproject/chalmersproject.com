import type { Controller } from "@hotwired/stimulus";

export function getComponentControllerForElement(
  currentController: Controller,
  element: HTMLElement,
): Controller | null {
  const controllers = (element.dataset.controller || "").split(" ");
  const identifier = controllers.find(name => name.endsWith("component"));
  if (identifier) {
    return currentController.application.getControllerForElementAndIdentifier(
      element,
      identifier,
    );
  }
  return null;
}

export const resolve = <T>(f: () => T): T => f();
