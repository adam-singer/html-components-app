import "dart:html";
import "dart:async";
import "package:html_components/components/multimedia/feedreader.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    queryAll('div[is="x-feedreader"]').forEach((DivElement element) {
      FeedReaderComponent feedReaderComponent = element.xtag;
      
      feedReaderComponent.onRefreshed.listen((Event event) {
        GrowlComponent.postMessage("", "Feed refreshed");
      });
    });
  });
}