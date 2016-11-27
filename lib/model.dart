part of exchange;

class Model {
  Map properties = { "name" : "SomeName", "password" : "secret" };

  Model() {

  }

  // Упростить if ы

  noSuchMethod(Invocation i) {

    String method = MirrorSystem.getName(i.memberName);

    if(method.endsWith("=") && properties.containsKey(method.replaceFirst("=", ""))) {
        method = method.replaceFirst("=", "");
        properties[method] = i.positionalArguments[0];
    }

    // if(method.endsWith("=")) {
    //   method = method.replaceFirst("=", "");
    //   if(properties.containsKey(method))
    //     properties[method] = i.positionalArguments[0];
    // }

    if(properties.containsKey(method))
      return properties[method];
    else
      throw "No such method or property $method in $this";

  }

  // Создать метод save для сохранения properties в файл
  // Load для чтения существующих properties

}
