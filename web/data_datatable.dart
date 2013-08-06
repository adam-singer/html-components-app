import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "dart:json" as json;
import "package:html_components/components/data/datatable.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-datatable"]').forEach((DivElement element) {
      DatatableComponent datatableComponent = element.xtag;
      
      datatableComponent.onSorted.listen((CustomEvent event) {
        String header = event.detail;
        GrowlComponent.postMessage("Column sorted:", header);
      });
      
      datatableComponent.onFiltered.listen((Event event) {
        GrowlComponent.postMessage("", "Column filtered!");
      });
      
      datatableComponent.onSelected.listen((Event event) {
        GrowlComponent.postMessage("", "Selection changed!");
      });
      
      datatableComponent.onEdited.listen((Event event) {
        GrowlComponent.postMessage("", "Row edited!");
      });
      
      datatableComponent.onColumnResized.listen((Event event) {
        GrowlComponent.postMessage("", "Column resized!");
      });
      
      datatableComponent.onRowToggled.listen((Event event) {
        GrowlComponent.postMessage("", "Row toggled!");
      });
    });
    
    queryAll('div[is="x-datatable"].cars').forEach((DivElement datatableElement) {
      DatatableComponent datatableComponent = datatableElement.xtag;
      
      if (datatableElement.classes.contains("short-list")) {
        datatableComponent.data = data.getCars(count: 10);
      }
      else {
        datatableComponent.data = data.getCars();
      }
    });
  });
}