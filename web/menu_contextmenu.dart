import "dart:html";
import "dart:async";
import "package:animation/animation.dart" as animation;
import "package:html_components/components/menu/contextmenu.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    queryAll('div[is="x-contextmenu"]').forEach((DivElement element) {
      ContextMenuComponent contextMenuComponent = element.xtag;
      
      contextMenuComponent.onSelected.listen((CustomEvent event) {
        if (event.detail == "Remove") {
          ImageElement imageElement = query("#image");
          imageElement.style.opacity = "0";
          
          Map<String, Object> animationProperties = {
            "height": 0
          };
          
          animation.animate(imageElement, properties: animationProperties, duration: 500).onComplete.listen((_) {
            imageElement.remove();
          });
        }
        else {
          GrowlComponent.postMessage("New item selected", "Label of the selected item: ${event.detail}");
        }
      });
    });
  });
}