import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "dart:json" as json;
import "package:html_components/components/data/datagrid.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-datagrid"]').forEach((DivElement element) {
      DatagridComponent datagridComponent = element.xtag;
      
      datagridComponent.onSelected.listen((CustomEvent event) {
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
    
    DatagridComponent datagridComponent = query('div[is="x-datagrid"].cars').xtag;
    datagridComponent.data = data.getCars();
  });
}