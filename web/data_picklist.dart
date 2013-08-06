import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/data/picklist.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-picklist"]').forEach((Element element) {
      PicklistComponent picklistComponent = element.xtag;
      
      picklistComponent.onChanged.listen((Event event) {
        String picked = data.convertListToString(picklistComponent.model.pickedItems);
        GrowlComponent.postMessage("Picked items:", picked);
      });
    });
    
    PicklistComponent stringPicklistComponent = query('div[is="x-picklist"].strings').xtag;
    stringPicklistComponent.items = data.getPlayerNames();
    
    PicklistComponent playerPicklistComponent = query('div[is="x-picklist"].players').xtag;
    playerPicklistComponent.items = data.getPlayers();
  });
}