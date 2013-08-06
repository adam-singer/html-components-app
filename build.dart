import 'dart:io';
import 'package:web_ui/component_build.dart';
import 'dart:async';

// Ref: http://www.dartlang.org/articles/dart-web-components/tools.html
main() {
  List<String> pages = <String>[
    'index.html',
    'components.html',
    
    // Data Components
    'data.html',
    'data_carousel.html',
    'data_datagrid.html',
    'data_datatable.html',
    'data_orderlist.html',
    'data_picklist.html',
    'data_selectlistbox.html',
    'data_tagcloud.html',
    'data_tree.html',
    'data_treetable.html',
    
    // Dialog Components
    'dialog.html',
    'dialog_confirmationdialog.html',
    'dialog_dialog.html',
    
    // Input Conmponents
    'input.html',
    'input_autocomplete.html',
    'input_booleanbutton.html',
    'input_maskedinput.html',
    'input_rating.html',
    'input_selectbutton.html',
    'input_selectcheckboxmenu.html',
    
    // Menu Components
    'menu.html',
    'menu_breadcrumb.html',
    'menu_contextmenu.html',
    'menu_menubutton.html',
    'menu_menubar.html',
    'menu_splitbutton.html',
    
    // Multimedia Components
    'multimedia.html',
    'multimedia_feedreader.html',
    'multimedia_gallery.html',
    'multimedia_imagecompare.html',
    'multimedia_lightbox.html',
    'multimedia_photocam.html',
    
    // Panel Components
    'panel.html',
    'panel_accordion.html',
    'panel_panel.html',
    'panel_tabview.html',
    
    // Utility Components
    'utility.html',
    'utility_clock.html',
    'utility_draggable.html',
    'utility_growl.html',
    'utility_notificationbar.html',
    'utility_resizable.html'
  ];
  
  List<String> buildPages = pages.map((String page) => "web/${page}").toList(growable: false);
  
  build(new Options().arguments, buildPages).then((_) {
    print("Compiling to Javascript");
    
    _compileToJS(pages).then((_) {
      print("Ready");
    });
  }).catchError((Object error) => print("An error occured: $error"));
}

Future _compileToJS(List<String> pages) {
  Completer completer = new Completer();
  List<Future> futures = [];
  
  for (String page in pages) {
    futures.add(_invokeDart2JS(page));
  }
  
  Future.wait(futures).then((_) {
    completer.complete();
  });
  
  return completer.future;
}

Future<ProcessResult> _invokeDart2JS(String htmlFile) {
  String dartFile = _getDartFile(htmlFile);
  
  File file = new File(dartFile);
  if (!file.existsSync()) {
    print(" -- NOT FOUND: $dartFile");
    Completer completer = new Completer();
    completer.complete(null);
    return completer.future;
  }
  
  String jsFile = _getJsFile(htmlFile);
  
  List<String> arguments = <String>[
    "-o",
    jsFile,
    "--minify",
    dartFile
  ];
  
  return Process.run(_dart2js_executable, arguments);
}

String get _dart2js_executable {
  if (Platform.isWindows) {
    return "dart2js.bat";
  }
  
  return "dart2js";
}

String _getDartFile(String fileName) {
  fileName = _getFileWithoutExtension(fileName);
  return "web/out/${fileName}.html_bootstrap.dart";
}

String _getJsFile(String fileName) {
  fileName = _getFileWithoutExtension(fileName);
  return "web/out/${fileName}.html_bootstrap.dart.js";
}

String _getFileWithoutExtension(String fileName) {
  int pointIndex = fileName.lastIndexOf(".");
  return fileName.substring(0, pointIndex);
}