import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/input/selectcheckboxmenu.dart";
import "package:html_components/components/input/selectitem.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

String convertSelectItemModelToString(SelectItemModel model) {
  return "${model.label} (${model.value})";
}

void main() {
  Timer.run(() {
    DivElement selectCheckboxMenuElement = query('div[is="x-selectcheckboxmenu"]');
    SelectCheckboxMenuComponent selectCheckboxMenuComponent = selectCheckboxMenuElement.xtag;
    
    selectCheckboxMenuComponent.onSelectChanged.listen((Event event) {
      String selection = data.convertListToString(selectCheckboxMenuComponent.model.selectedItems, customMapper: convertSelectItemModelToString);
      GrowlComponent.postMessage("Selection changed!", "Selected: $selection");
    });
  });
}