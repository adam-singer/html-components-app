import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "dart:json" as json;
import "package:html_components/components/data/carousel.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-carousel"]').forEach((DivElement element) {
      CarouselComponent carouselComponent = element.xtag;
      
      carouselComponent.onSelected.listen((CustomEvent event) {
        String detail = event.detail;
        
        try {
          Map map = json.parse(detail);
          GrowlComponent.postMessage("Selected:", map["model"]);
        }
        on FormatException catch (error) {
          GrowlComponent.postMessage("Selected:", detail);
        }
      });
    });
    
    CarouselComponent carouselComponent = query('div[is="x-carousel"].cars').xtag;
    carouselComponent.data = data.getCars(count: 12);
  });
}