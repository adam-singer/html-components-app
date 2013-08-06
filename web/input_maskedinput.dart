import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/input/maskedinput.dart";
import "package:html_components/components/utility/growl.dart";

void main() {
  Timer.run(() {
    queryAll('div[is="x-maskedinput"]').forEach((Element element) {
      MaskedInputComponent maskedInputComponent = element.xtag;
      
      maskedInputComponent.onValueChanged.listen((Event event) {
        String newValue = maskedInputComponent.value;
        GrowlComponent.postMessage("Value changed!", "New value: $newValue");
      });
    });
  });
}