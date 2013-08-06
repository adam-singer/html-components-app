import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/dialog/dialog.dart";
import "package:html_components/components/utility/growl.dart";

class DialogForm {
  DialogComponent modalDialog;
  DialogComponent nonModalDialog;
  
  DialogForm() {
    modalDialog = query("#modal-dialog").xtag;
    nonModalDialog = query("#nonmodal-dialog").xtag;
  }
  
  void showModal(MouseEvent event) {
    modalDialog.show();
    event.preventDefault();
  }
  
  void showNonModal(MouseEvent event) {
    nonModalDialog.show();
    event.preventDefault();
  }
  
  void closeAll() {
    modalDialog.hide();
    nonModalDialog.hide();
  }
}

@observable
class Dialog {
  String username = "";
  String password = "";
  
  void login(MouseEvent event) {
    if (username == "" || password == "") {
      return;
    }
    
    if (username == "admin" && password == "admin") {
      GrowlComponent.postMessage("Login successful!", "Welcome, admin!");
    }
    else {
      GrowlComponent.postMessage("Login failed!", "The username or password is incorrect!", "warn");
    }
    
    username = "";
    password = "";
    
    dialogForm.closeAll();
    event.preventDefault();
  }
}

DialogForm dialogForm;
Dialog dialog = new Dialog();

void main() {
  Timer.run(() => dialogForm = new DialogForm());
}