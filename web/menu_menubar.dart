import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/menu/menubar.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    queryAll('div[is="x-menubar"]').forEach((DivElement menubarElement) {
      MenubarComponent menubarComponent = menubarElement.xtag;
      
      menubarComponent.onSelected.listen((CustomEvent event) {
        GrowlComponent.postMessage("New item selected", "Label of the selected item: ${event.detail}");
      });
    });
  });
}