import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  group("noSuchMethod", () {
    test("it returns existent property", () {
      var model = new Model();
      expect(model.name, equals("SomeName"));
    });

    test("it throws error if property does't exists", () {
      expect(() => new Model().hello, throws);
    });

    test("it sets value of existent property", () {
      var model = new Model();
      expect(model.name = "NewName", equals("NewName"));
    });
  });
}
