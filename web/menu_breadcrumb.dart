import "dart:html";
import "dart:async";
import "package:html_components/components/menu/breadcrumb.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    BreadcrumbComponent breadcrumbComponent = query('div[is="x-breadcrumb"]').xtag;
    
    breadcrumbComponent.onSelected.listen((CustomEvent event) {
      GrowlComponent.postMessage("New item selected", "Label of the selected item: ${event.detail}");
    });
  });
}