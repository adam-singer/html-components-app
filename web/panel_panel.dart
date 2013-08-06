import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/panel/panel.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    queryAll('div[is="x-panel"]').forEach((Element element) {
      PanelComponent panelComponent = element.xtag;
      
      panelComponent.onToggled.listen((CustomEvent event) {
        if (event.detail == "HIDDEN") {
          GrowlComponent.postMessage("", "Panel is hidden");
        }
        else if (event.detail == "VISIBLE") {
          GrowlComponent.postMessage("", "Panel is visible");
        }
      });
      
      panelComponent.onClosed.listen((Event event) {
        GrowlComponent.postMessage("", "Panel is closed");
      });
    });
  });
}