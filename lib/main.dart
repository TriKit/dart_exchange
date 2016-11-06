import 'user.dart';
import 'asset.dart';
import 'offer.dart';
import 'contract.dart';
import 'balance.dart';

main() {
  var user = new User('Ivan', 'ivan@gmail.com', 'secret');

  var user2 = new User('Ivan', 'ivan@gmail.com', 'secret');

  var balance1 = new Balance();
  balance1.asset = new Asset('usd', 'united states dollar');

  // balance1.user = user;
  // print(balance1.user);
  // print(user.balances);

  var offer = new Offer();
  offer.proposed_asset = new Asset('rub', 'russian federation rubl');
  offer.proposed_amount = 64;
  offer.wish_asset = new Asset('usd', 'united states dollar');
  offer.wish_amount = 1;
  offer.user = user;
  print(offer);
  // print(offer.user.name);
  // print(offer.amount);
}
