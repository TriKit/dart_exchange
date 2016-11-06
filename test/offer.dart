import "package:test/test.dart";
import '../lib/user.dart';
import '../lib/asset.dart';
import '../lib/offer.dart';
import '../lib/contract.dart';
import '../lib/balance.dart';

void main() {
  var user = new User('Ivan', 'ivan@gmail.com', 'secret');
  var offer = new Offer();
  offer.proposed_asset = new Asset('usd', 'united states dollar');
  offer.proposed_amount = 50;
  offer.wish_asset = new Asset('rub', 'russian federation rubl');
  offer.wish_amount = 3200;
  offer.user = user;

  test("toString() returns text representation of the offer", (){
    expect(offer.toString(), equals("Ivan offers 50 usd for 3200 rub"));
  });
}
