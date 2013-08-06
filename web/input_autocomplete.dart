import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/input/autocomplete.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

void main() {
  Timer.run(() {
    queryAll('div[is="x-autocomplete"]').forEach((Element element) {
      AutocompleteComponent autocompleteComponent = element.xtag;
      
      autocompleteComponent.onValueChanged.listen((Event event) {
        String newValue = autocompleteComponent.model.value;
        GrowlComponent.postMessage("Value changed!", "New value: $newValue");
      });
    });
    
    queryAll(".players").forEach((Element element) {
      AutocompleteComponent objectClientAutocomplete = element.xtag;
      objectClientAutocomplete.data = data.getPlayers();
    });
    
    queryAll(".strings").forEach((Element element) {
      AutocompleteComponent objectClientAutocomplete = element.xtag;
      objectClientAutocomplete.data = data.getPlayerNames();
    });
  });
}