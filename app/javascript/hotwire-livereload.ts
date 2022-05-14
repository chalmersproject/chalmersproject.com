import consumer from "app/javascript/channels/consumer";
import debounce from "debounce";

const received = debounce(
  () => {
    console.log("[Hotwire::Livereload] Files changed");
    Turbo.visit(window.location.href);
  },
  300,
  false,
);

consumer.subscriptions.create("Hotwire::Livereload::ReloadChannel", {
  received,
  connected() {
    console.log("[Hotwire::Livereload] Websocket connected");
  },
  disconnected() {
    console.log("[Hotwire::Livereload] Websocket disconnected");
  },
});
