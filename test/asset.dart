import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var asset   = new Asset("usd", "united states dollar");
  var asset_2 = new Asset("usd", "united states dollar");
  var asset_3 = new Asset("euro", "eurozone currency");

  test("pushNewAsset() function", () {
    expect(Asset.assets.length, equals(2));
  });

  group("find() method", () {
    test("returns existance asset", () {
      expect(Asset.find("usd"), equals(asset));
    });

    test("creates and returns new asset", () {
      expect((Asset.find("rub") is Asset), isTrue);
      expect(Asset.assets.last.code, equals("rub"));
    });
  });
}
