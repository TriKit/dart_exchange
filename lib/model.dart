part of exchange;

class Model {
  Map properties = { "name" : "SomeName", "password" : "secret" };

  Model([Map props=null]) {
    if(props != null) {
      props.keys.forEach((k) {
        if(properties[k] != null) {
          properties[k] = props[k];
        }
      });
    }
  }

  noSuchMethod(Invocation i) {
    String method = MirrorSystem.getName(i.memberName);

    if(method.endsWith("=")) {
      method = method.replaceFirst("=", "");
      if(properties.containsKey(method))
        properties[method] = i.positionalArguments[0];
    }

    if(properties.containsKey(method))
      return properties[method];
    else
      throw "No such method or property $method in $this";

  }

  Future saveProperties(String filename) {
    return new File(filename).writeAsString(JSON.encode(this.properties));
  }

  Future loadProperties(String filename) {
    if(FileSystemEntity.typeSync(filename) != FileSystemEntityType.NOT_FOUND) {
      var f = new File(filename).readAsString();
      f.then((String contents) {
        this.properties = JSON.decode(contents);
      });
      return f;
    } else {
      throw "Wrong path: $filename";
    }
  }

  assignProperties(map) {
    this.properties = map;
  }

}
