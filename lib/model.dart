part of exchange;

class Model {
  Map properties = { "name" : "SomeName", "password" : "secret" };

  Model() {

  }

  // Simplifiy if
  // this is type of objects passed to Object.noSuchMethod when an object
  // doesn't support the member of invocation that was attempted to
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

  // Save properties to file
  Future saveProps(String path, String fileName, {info: null}) {
    return new File("$path/$fileName" + ".json").writeAsString(JSON.encode(this.properties));
  }

  // Load properties
  loadProperties(String path, String fileName) async {
    if(FileSystemEntity.typeSync("$path/$fileName" + ".json") != FileSystemEntityType.NOT_FOUND) {
      await new File("$path/$fileName" + ".json").readAsString().then((String contents) {
        this.properties = JSON.decode(contents);
      });
    } else
        throw "Wrong path:$path or file name: $fileName";

  }

  assignProperties(map) {
    this.properties = map;
  }

}
