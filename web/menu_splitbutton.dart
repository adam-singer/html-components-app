import "dart:html";
import "dart:async";
import "package:html_components/components/menu/splitbutton.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    DivElement splitButtonElement = query('div[is="x-splitbutton"]');
    SplitButtonComponent splitButtonComponent = splitButtonElement.xtag;
    
    splitButtonComponent.onSelected.listen((CustomEvent event) {
      GrowlComponent.postMessage("New item selected", "Label of the selected item: ${event.detail}");
    });
  });
}