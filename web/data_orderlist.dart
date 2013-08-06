import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/data/orderlist.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-orderlist"]').forEach((Element element) {
      OrderlistComponent orderlistComponent = element.xtag;
      
      orderlistComponent.onChanged.listen((Event event) {
        String order = data.convertListToString(orderlistComponent.model.items);
        GrowlComponent.postMessage("New order:", order);
      });
    });
    
    OrderlistComponent stringOrderlistComponent = query('div[is="x-orderlist"].strings').xtag;
    stringOrderlistComponent.items = data.getPlayerNames();
    
    OrderlistComponent playerOrderlistComponent = query('div[is="x-orderlist"].players').xtag;
    playerOrderlistComponent.items = data.getPlayers();
  });
}