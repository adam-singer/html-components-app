import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/utility/resizable.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  // Remove Timer if xtag returns the component instead of DivElement
  Timer.run(() {
    queryAll('div[is="x-resizable"]').forEach((Element element) {
      ResizableComponent resizableComponent = element.xtag;
      
      resizableComponent.onResized.listen((Event event) {
        Size newSize = resizableComponent.model.currentSize;
        GrowlComponent.postMessage("Size changed!",
            "New size: [${newSize.width}, ${newSize.height}]");
      });
    });
  });
}