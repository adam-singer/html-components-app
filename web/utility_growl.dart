import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/utility/growl.dart";

@observable
class GrowlForm {
  String summary = "";
  String detail = "";
  String severity = "info";
  
  void postGrowlMessage(MouseEvent event) {
    if (summary == "" || detail == "") {
      return;
    }
    
    GrowlComponent.postMessage(summary, detail, severity);
    
    summary = "";
    detail = "";
    severity = "info";
    
    event.preventDefault();
  }
}

GrowlForm growlForm = new GrowlForm();

void main() {
  
}