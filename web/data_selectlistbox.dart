import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/data/selectlistbox.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-selectlistbox"]').forEach((Element element) {
      SelectListboxComponent selectListboxComponent = element.xtag;
      
      selectListboxComponent.onChanged.listen((Event event) {
        if (selectListboxComponent.model.selection == "single") {
          Object selectedItem = selectListboxComponent.model.selectedItem;
          String selected = data.convertObjectToString(selectedItem);
          GrowlComponent.postMessage("Selected item:", selected);
        }
        else {
          List<Object> selectedItems = selectListboxComponent.model.selectedItems;
          String selected = data.convertListToString(selectedItems);
          GrowlComponent.postMessage("Selected items:", selected);
        }
      });
    });
    
    query('div[is="x-selectlistbox"].strings').xtag.items = data.getPlayerNames();
    query('div[is="x-selectlistbox"].players').xtag.items = data.getPlayers();
  });
}