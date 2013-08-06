part of data;

String convertListToString(List list, {String customMapper(Object object): null}) {
  if (list.isEmpty) {
    return "None";
  }
  else if (list.length == 1) {
    return convertObjectToString(list.first, customMapper: customMapper);
  }
  else {
    StringBuffer resultBuffer = new StringBuffer();

    for (Object item in list) {
      String stringRepresentation = convertObjectToString(item, customMapper: customMapper);
      resultBuffer.write("${stringRepresentation}, ");
    }

    String result = resultBuffer.toString();

    return result.substring(0, result.length - 2);
  }
}


String convertObjectToString(Object object, {String customMapper(Object object): null}) {
  if (customMapper != null) {
    return customMapper(object);
  }
  else if (object is String) {
    return object;
  }
  else if (object is Player) {
    return object.name;
  }
  
  return object.toString();
}