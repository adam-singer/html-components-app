import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/panel/tabview.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

@observable
class TabviewForm {
  String orientation = "top";
}

TabviewForm tabviewForm = new TabviewForm();

void main() {
  Timer.run(() {
    queryAll('div[is="x-tabview"]').forEach((Element element) {
      TabviewComponent tabviewComponent = element.xtag;
      
      tabviewComponent.onSelected.listen((CustomEvent event) {
        String title = event.detail;
        GrowlComponent.postMessage("Selected tab:", title);
      });
      
      tabviewComponent.onClosed.listen((CustomEvent event) {
        String title = event.detail;
        GrowlComponent.postMessage("Closed tab:", title);
      });
    });
    
    TabviewComponent tabviewModelComponent = query('div[is="x-tabview"].players').xtag;
    tabviewModelComponent.data = data.getPlayers();
  });
}