import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/input/rating.dart";
import "package:html_components/components/utility/growl.dart";

@observable
class RatingForm {
  int stars = 5;
  int value = 0;
  bool cancelable = true;
  bool readonly = false;
  bool disabled = false;
  
  String get stars_bindable => stars.toString();
  set stars_bindable(String stars_bindable) => stars = int.parse(stars_bindable);
  
  String get value_bindable => value.toString();
  set value_bindable(String value_bindable) => value = int.parse(value_bindable);
}

RatingForm ratingForm = new RatingForm();

void main() {
  Timer.run(() {
    queryAll('div[is="x-rating"]').forEach((Element element) {
      RatingComponent ratingComponent = element.xtag;
      
      ratingComponent.onValueChanged.listen((Event event) {
        int newValue = ratingComponent.value;
        ratingForm.value = newValue;
        GrowlComponent.postMessage("Value changed!", "New value: $newValue");
      });
    });
  });
}