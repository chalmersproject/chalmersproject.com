import { Controller } from "@hotwired/stimulus";
import invariant from "tiny-invariant";
import cuid from "cuid";

import { first } from "lodash";
import { resolve } from "app/javascript/helpers";

import Uppy from "@uppy/core";
import UppyDashboard from "@uppy/dashboard";
import UppyImageEditor from "@uppy/image-editor";
import UppyUrl from "@uppy/url";
import UppyActiveStorageUpload from "uppy-activestorage-upload";

export default class extends Controller {
  static targets = ["field", "preview", "uploadTrigger", "removeTrigger"];

  fieldTarget: HTMLInputElement;
  previewTarget: HTMLImageElement;
  uploadTriggerId = "file_input_component-upload_trigger-" + cuid();
  uploadTriggerTarget: HTMLButtonElement;
  removeTriggerTarget: HTMLButtonElement;

  uppy?: Uppy;

  getDirectUploadUrl(): string {
    invariant(this.element instanceof HTMLElement);
    const url = this.element.dataset.directUploadUrl;
    invariant(url, "missing upload URL");
    return url;
  }

  uploadTriggerTargetConnected(element: HTMLButtonElement) {
    // Set trigger ID
    element.id = this.uploadTriggerId;

    // Initialize Uppy
    this.uppy = new Uppy({
      restrictions: {
        allowedFileTypes: ["image/*"],
        maxNumberOfFiles: 1,
      },
    })
      .use(UppyImageEditor, {})
      .use(UppyDashboard, {
        trigger: "#" + this.uploadTriggerId,
        plugins: ["ImageEditor"],
        autoOpenFileEditor: true,
      })
      .use(UppyUrl, {
        target: UppyDashboard,
        companionUrl: "https://companion.uppy.io",
      })
      .use(UppyActiveStorageUpload, {
        directUploadUrl: this.getDirectUploadUrl(),
      })
      .on("complete", ({ successful }) => {
        const file = first(successful);
        if (file) {
          const { response, data } = file;

          // Set field value
          resolve(() => {
            invariant(response);
            const signedId = (response as Record<string, unknown>)["signed_id"];
            invariant(typeof signedId === "string");
            this.fieldSet(signedId);
          });

          // Set preview src
          resolve(() => {
            const reader = new FileReader();
            reader.onloadend = () => {
              const { result } = reader;
              if (typeof result === "string") {
                this.previewTarget.src = result.toString();
              }
            };
            reader.readAsDataURL(data);
          });
        }
      });
  }

  removeTriggerTargetConnected(element: HTMLButtonElement) {
    element.addEventListener("click", this.fieldClear.bind(this));
  }

  removeTriggerTargetDisconnected(element: HTMLButtonElement) {
    element.removeEventListener("click", this.fieldClear.bind(this));
  }

  fieldSet(value: string) {
    if (value) {
      this.fieldTarget.value = value;
      this.element.classList.remove("empty");
    }
  }

  fieldClear() {
    this.fieldTarget.value = "";
    this.previewTarget.removeAttribute("src");
    this.element.classList.add("empty");
  }

  disconnect() {
    // Destroy Uppy
    if (this.uppy) {
      this.uppy.close();
    }
  }
}
