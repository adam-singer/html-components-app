import "dart:html";
import "dart:async";
import "package:html_components/components/data/tagcloud.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    TagcloudComponent tagcloudComponent = query('div[is="x-tagcloud"]').xtag;
    
    tagcloudComponent.onSelected.listen((CustomEvent event) {
      GrowlComponent.postMessage("Tag selected", "Label of the selected tag: ${event.detail}");
    });
  });
}