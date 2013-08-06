import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/panel/accordion.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-accordion"]').forEach((Element element) {
      AccordionComponent accordionComponent = element.xtag;
      
      accordionComponent.onSelected.listen((CustomEvent event) {
        String title = event.detail;
        GrowlComponent.postMessage("Selected tab:", title);
      });
      
      accordionComponent.onDeselected.listen((CustomEvent event) {
        String title = event.detail;
        GrowlComponent.postMessage("Deselected tab:", title);
      });
    });
    
    AccordionComponent accordionModelComponent = query('div[is="x-accordion"].players').xtag;
    accordionModelComponent.data = data.getPlayers();
  });
}