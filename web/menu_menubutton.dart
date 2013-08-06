import "dart:html";
import "dart:async";
import "package:html_components/components/menu/menubutton.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    DivElement menuButtonElement = query('div[is="x-menubutton"]');
    MenuButtonComponent menuButtonComponent = menuButtonElement.xtag;
    
    menuButtonComponent.onSelected.listen((CustomEvent event) {
      GrowlComponent.postMessage("New item selected", "Label of the selected item: ${event.detail}");
    });
  });
}