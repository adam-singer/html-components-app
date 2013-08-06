import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/utility/draggable.dart";
import "package:html_components/components/utility/growl.dart";

@observable
class DraggableForm {
  String axis = "xy";
}

DraggableForm draggableForm = new DraggableForm();

void main() {
  // Remove Timer if xtag gives the component object instead of DivElement
  Timer.run(() {
    DraggableComponent draggableComponent = query('div[is="x-draggable"]').xtag;
    
    draggableComponent.onDropped.listen((Event event) {
      GrowlComponent.postMessage("", "Element dropped!");
    });
  });
}