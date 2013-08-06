import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/dialog/confirmationdialog.dart";
import "package:html_components/components/utility/growl.dart";

class ConfirmationDialogForm {
  ConfirmationDialogComponent alertConfirmationDialog;
  ConfirmationDialogComponent infoConfirmationDialog;
  
  ConfirmationDialogForm() {
    alertConfirmationDialog = query("#alert-dialog").xtag;
    infoConfirmationDialog = query("#info-dialog").xtag;
  }
  
  void showAlertDialog(MouseEvent event) {
    alertConfirmationDialog.show();
    event.preventDefault();
  }
  
  void showInfoDialog(MouseEvent event) {
    infoConfirmationDialog.show();
    event.preventDefault();
  }
  
  void handleResult(MouseEvent event) {
    event.preventDefault();
    
    Element target = event.target;
    String label = target.text;
    
    switch (label) {
      case "Yes sure":
        GrowlComponent.postMessage("", "Destroy process started", "warn");
        break;
      
      case "Not yet":
        GrowlComponent.postMessage("", "Until next time!");
        break;
      
      case "Yes":
      case "No":
      case "Cancel":
        GrowlComponent.postMessage("You chose:", label);
        break;
    }
  }
}

ConfirmationDialogForm confirmationDialogForm;

void main() {
  Timer.run(() => confirmationDialogForm = new ConfirmationDialogForm());
}