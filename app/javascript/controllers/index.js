import { identifierForContextKey } from "@hotwired/stimulus-webpack-helpers";
import { application } from "./application";

function definitionsFromContext(context) {
  return Object.keys(context).map(filename => ({
    identifier: identifierForContextKey(filename),
    controllerConstructor: context[filename],
  }));
}

// Load controllers
import controllersContext from "./**/*_controller.{js,ts}";
application.load(definitionsFromContext(controllersContext));

// Load component controllers
import componentControllersContext from "../../components/**/*_controller.{js,ts}";
application.load(definitionsFromContext(componentControllersContext));
