import "package:test/test.dart";
import '../lib/asset.dart';


void main() {
  var asset   = new Asset("usd", "united states dollar");
  var asset_2 = new Asset("usd", "united states dollar");
  var asset_3 = new Asset("euro", "eurozone currency");

  asset.pushNewAsset();
  asset_2.pushNewAsset();
  asset_3.pushNewAsset();

  test("toString() returns asset parameters in text form", () {
    expect(asset.toString(), equals("usd united states dollar"));
  });

  test("pushNewAsset() function", () {
    expect(Asset.assets.length, equals(2));
  });
}
