import "package:test/test.dart";
import '../lib/asset.dart';


void main() {
  var asset = new Asset('usd', 'united states dollar');

  test('toString() returns asset parameters in text form', () {
    expect(asset.toString(), equals('usd united states dollar'));
  });
}
