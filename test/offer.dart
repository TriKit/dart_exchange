import "package:test/test.dart";
import '../lib/user.dart';
import '../lib/asset.dart';
import '../lib/offer.dart';
import '../lib/contract.dart';
import '../lib/balance.dart';

void main() {
  var user = new User('Ivan', 'ivan@gmail.com', 'secret');
  var offer = new Offer();
  offer.ask = new Asset('usd', 'united states dollar');
  offer.amount = 50;
  offer.bid = new Asset('rub', 'russian federation rubl');
  offer.price = 3200;
  offer.user = user;

  test("toString() returns text representation of the offer", (){
    expect(offer.toString(), equals("Ivan offers 50 usd for 3200 rub"));
  });
}
