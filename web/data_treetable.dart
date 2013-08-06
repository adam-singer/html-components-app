import "package:web_ui/web_ui.dart";
import "dart:html";
import "dart:async";
import "dart:json" as json;
import "package:html_components/components/data/treetable.dart";
import "package:html_components/components/utility/growl.dart";
import "data/data.dart" as data;

String _getStringDetail(String detail) {
  try {
    Map map = json.parse(detail);
    return map["name"];
  }
  on FormatException catch (error) {
    return detail;
  }
}

List<String> _getSelectionAsString(List<TreeNode> nodes) {
  List<String> result = [];
  
  for (TreeNode node in nodes) {
    if (node.data is Map) {
      result.add(node.data["name"]);
    }
    else {
      result.add(node.data.name);
    }
  }
  
  return result;
}

// cannot be in separate library because the root setter throws exception
// given TreeNode object is not String and is not TreeNode according to it
class Document {
  String name;
  String size;
  String type;
  
  Document(String this.name, String this.size, String this.type);
  
  String toString() => name;
}

TreeNode getStringRoot() {
  TreeNode stringRoot = new TreeNode();
  
  StringTreeNode node0 = new StringTreeNode("Node 0", stringRoot);
  StringTreeNode node1 = new StringTreeNode("Node 1", stringRoot);
  StringTreeNode node2 = new StringTreeNode("Node 2", stringRoot);
  
  StringTreeNode node00 = new StringTreeNode("Node 0.0", node0);
  StringTreeNode node01 = new StringTreeNode("Node 0.1", node0);
  
  StringTreeNode node10 = new StringTreeNode("Node 1.0", node1);
  StringTreeNode node11 = new StringTreeNode("Node 1.1", node1);
  
  StringTreeNode node000 = new StringTreeNode("Node 0.0.0", node00);
  StringTreeNode node001 = new StringTreeNode("Node 0.0.1", node00);
  
  StringTreeNode node010 = new StringTreeNode("Node 0.1.0", node01);
  
  StringTreeNode node100 = new StringTreeNode("Node 1.0.0", node10);
  
  return stringRoot;
}

TreeNode getDocumentRoot() {
  TreeNode documentRoot = new TreeNode();
  
  TreeNode documents = new TreeNode(new Document("Documents", "80 KB", "Folder"), documentRoot);
  TreeNode pictures = new TreeNode(new Document("Pictures", "171 KB", "Folder"), documentRoot);
  TreeNode movies = new TreeNode(new Document("Movies", "79 GB", "Folder"), documentRoot);
  TreeNode work = new TreeNode(new Document("Work", "40 KB", "Folder"), documents);
  TreeNode htmlComponents = new TreeNode(new Document("HTML Components", "3 MB", "Folder"), documents);
  
  //Documents
  TreeNode expenses = new TreeNode(new Document("Expenses.doc", "30 KB", "Word Document"), work, "document");
  TreeNode resume = new TreeNode(new Document("Resume.doc", "10 KB", "Word Document"), work, "document");
  TreeNode documentation = new TreeNode(new Document("Documentation.pdf", "3 MB", "PDF Document"), htmlComponents, "document");
  
  //Pictures
  TreeNode barca = new TreeNode(new Document("barcelona.jpg", "30 KB", "JPEG Image"), pictures, "picture");
  TreeNode logo = new TreeNode(new Document("logo.jpg", "45 KB", "JPEG Image"), pictures, "picture");
  TreeNode honda = new TreeNode(new Document("honda.png", "96 KB", "PNG Image"), pictures, "picture");
  
  //Movies
  TreeNode pacino = new TreeNode(new Document("Al Pacino", "39 GB", "Folder"), movies);
  TreeNode deniro = new TreeNode(new Document("Robert De Niro", "40 GB", "Folder"), movies);
  TreeNode scarface = new TreeNode(new Document("Scarface", "15 GB", "Movie File"), pacino, "movie");
  TreeNode carlitosWay = new TreeNode(new Document("Carlitos' Way", "24 GB", "Movie File"), pacino, "movie");
  TreeNode goodfellas = new TreeNode(new Document("Goodfellas", "23 GB", "Movie File"), deniro, "movie");
  TreeNode untouchables = new TreeNode(new Document("Untouchables", "17 GB", "Movie File"), deniro, "movie");
  
  return documentRoot;
}

void main() {
  Timer.run(() {
    queryAll('div[is="x-treetable"]').forEach((Element element) {
      TreetableComponent treetableComponent = element.xtag;
      
      treetableComponent.onExpanded.listen((CustomEvent event) {
        String stringDetail = _getStringDetail(event.detail);
        GrowlComponent.postMessage("Expanded node:", stringDetail);
      });
      
      treetableComponent.onCollapsed.listen((CustomEvent event) {
        String stringDetail = _getStringDetail(event.detail);
        GrowlComponent.postMessage("Collapsed node:", stringDetail);
      });
      
      treetableComponent.onSelected.listen((Event event) {
        List<String> detailList = _getSelectionAsString(treetableComponent.model.selectedNodes);
        GrowlComponent.postMessage("Selected nodes:", data.convertListToString(detailList));
      });
      
      treetableComponent.onColumnResized.listen((Event event) {
        GrowlComponent.postMessage("", "Column resized!");
      });
    });
    
    query('div[is="x-treetable"].documents').xtag.root = getDocumentRoot();
  });
}