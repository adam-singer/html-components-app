import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/input/booleanbutton.dart";
import "package:html_components/components/utility/growl.dart";

@observable
class BooleanButtonForm {
  String labelOn = "On";
  String labelOff = "Off";
  bool showIcon = false;
  bool pressed = false;
}

BooleanButtonForm booleanButtonForm = new BooleanButtonForm();

void main() {
  Timer.run(() {
    queryAll('div[is="x-booleanbutton"]').forEach((Element element) {
      BooleanButtonComponent booleanButtonComponent = element.xtag;
      
      booleanButtonComponent.onValueChanged.listen((Event event) {
        bool newValue = booleanButtonComponent.pressed;
        booleanButtonForm.pressed = newValue;
        GrowlComponent.postMessage("Value changed!", "New value: $newValue");
      });
    });
  });
}