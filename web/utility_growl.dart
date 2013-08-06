import "dart:html";
import "package:polymer/polymer.dart";
import "package:fancy_syntax/syntax.dart";
import "package:html_components_polymer/components/utility/growl.dart";
import "package:html_components_polymer/components/utility/growl_message.dart";
import "package:html_components_polymer/components/common/enums.dart";

//@observable
class GrowlForm {
  String summary = "";
  String detail = "";
  String severity = "info";
  
  void postGrowlMessage(Event event) {
    if (summary == "" || detail == "") {
      return;
    }
    
    event.preventDefault();
    
    GrowlComponent.postMessage(summary, detail, severity);
    
    summary = "";
    detail = "";
    severity = "info";
  }
}

void postGrowlMessage(Event event) {
  InputElement summaryElement = query("#summary");
  InputElement detailElement = query("#detail");
  SelectElement severityElement = query("#severity");
  
  String summary = summaryElement.value;
  String detail = detailElement.value;
  String severity = severityElement.value;
  
  if (summary == "" || detail == "") {
    return;
  }
  
  event.preventDefault();
  
  GrowlComponent.postMessage(summary, detail, severity);
  
  summaryElement.value = "";
  detailElement.value = "";
  severityElement.value = "info";
}

GrowlForm growlForm = new GrowlForm();

void main() {
  List<GrowlMessageModel> growlMessages = [
    new GrowlMessageModel.initialized("Info", "Message detail", new Severity.fromString("info")),
    new GrowlMessageModel.initialized("Warn", "Message detail", new Severity.fromString("warn")),
    new GrowlMessageModel.initialized("Error", "Message detail", new Severity.fromString("error")),
    new GrowlMessageModel.initialized("Fatal", "Message detail", new Severity.fromString("fatal"))
  ];
  
  query("#growlTemplate").model = growlMessages;
  query("#postGrowlMessageButton").onClick.listen((Event event) => postGrowlMessage(event));
}