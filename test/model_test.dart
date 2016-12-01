import "package:test/test.dart";
import "../lib/exchange.dart";
import "dart:io";

void main() {
  var model;
  setUp(() {
    model = new Model();
  });
  group("noSuchMethod", () {
    test("it returns existent property", () {
      expect(model.name, equals("SomeName"));
    });

    test("it throws error if property doesn't exists", () {
      expect(() => new Model().hello, throws);
    });

    test("it sets value of existent property", () {
      model.name = "NewName";
      expect(model.properties["name"], equals("NewName"));
    });
  });

  group("saveProps", () {
    test("it creates json file in props directory", () {
      model.saveProps("test/props", "test");
      expect(FileSystemEntity.typeSync("test/props/test.json") != FileSystemEntityType.NOT_FOUND, equals(true));
    });
  });

  group("loadProps", () {
    test("it trows error if file does't exist", () {
      expect(() => model.loadProperties("test/props", "not_a_props"), throws);
    });
    test("it loads propreties from file", () {
      model.loadProperties("test/props", "new_props");
      expect(model.properties, equals({"name":"NewName","password":"topSecret"}));
    });
  });
}
