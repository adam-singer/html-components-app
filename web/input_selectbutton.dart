import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/input/selectbutton.dart";
import "package:html_components/components/input/selectitem.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

String convertSelectItemModelToString(SelectItemModel model) {
  return "${model.label} (${model.value})";
}

void main() {
  Timer.run(() {
    queryAll('div[is="x-selectbutton"]').forEach((Element element) {
      SelectButtonComponent selectButtonComponent = element.xtag;
      
      selectButtonComponent.onSelectChanged.listen((Event event) {
        String selection = data.convertListToString(selectButtonComponent.model.selectedItems,
            customMapper: convertSelectItemModelToString);
        GrowlComponent.postMessage("Selection changed!", "Selected: $selection");
      });
    });
  });
}