import "package:test/test.dart";
import "../lib/exchange.dart";
import "dart:io";

main() {

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

    test("it throws error if property setter doesn't exist", () {
      expect(() => new Model().hello = "hello", throws);
    });
  });

  group("saveProps", () {
    test("it creates json file in props directory", () {
      model.saveProperties("test/props/test.json");
      expect(FileSystemEntity.typeSync("test/props/test.json") != FileSystemEntityType.NOT_FOUND, equals(true));
    });
  });

  group("loadProps", () {
    test("it trows error if file doesn't exist", () {
      expect(() => model.loadProperties("test/props", "not_a_props"), throws);
    });

    test("it loads propreties from file", () {
      model.loadProperties("test/props/new_props.json").then((data) {
        expect(model.properties, equals({"name":"NewName","password":"TopSecret"}));
      });
    });
  });
}
