import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "package:html_components/components/utility/notificationbar.dart";

class NotificationBarForm {
  NotificationBarComponent notificationBarComponent;
  
  NotificationBarForm() {
    // Remove Timer when xtag returns the component instead of DivElement
    Timer.run(() {
      DivElement notificationBarDiv = query('div[is="x-notificationbar"]');
      notificationBarComponent = notificationBarDiv.xtag;
    });
  }
  
  void show(MouseEvent event) {
    notificationBarComponent.show();
    event.preventDefault();
  }
  
  void hide(MouseEvent event) {
    notificationBarComponent.hide();
    event.preventDefault();
  }
}

NotificationBarForm notificationBarForm;

void main() {
  notificationBarForm = new NotificationBarForm();
}