part of data;

class Car {
  String model;
  String manufacturer;
  int year;
  bool warranty;
  
  Car(String this.model, String this.manufacturer, int this.year, bool this.warranty);
  
  String get imagePath => "${manufacturer}.jpg";
  
  String toString() => model;
}

class Player {
  String name;
  int number;
  
  Player(String this.name, int this.number);
  
  String get imagePath => "${name.toLowerCase()}.jpg";
  
  String toString() => "Player[name=$name, number=$number, imagePath=$imagePath]";
}