import 'user.dart';
import 'asset.dart';
import 'offer.dart';
import 'contract.dart';
import 'balance.dart';

main() {
  // Users
  var seller = new User('Ivan', 'ivan@gmail.com', 'secret');
  var buyer = new User('John', 'john@gmail.com', 'secret');

  // add 100 dollars to seller balance
  var seller_dollar_balance = new Balance();
  seller_dollar_balance.asset = new Asset('usd', 'united states dollar');
  seller_dollar_balance.amount = 100;
  seller_dollar_balance.user = seller;

  // add 10.000 rubles to buyer balance
  var buyer_rub_balance = new Balance();
  buyer_rub_balance.asset = new Asset('rub', 'russian federation rubl');
  buyer_rub_balance.amount = 10000;
  buyer_rub_balance.user = buyer;

  // Offer from seller to sell 50 dollars for 3000 rubles
  var offer = new Offer();
  offer.ask = new Asset('usd', 'united states dollar');
  offer.amount = 40;
  offer.bid = new Asset('rub', 'russian federation rubl');
  offer.price = 2700;
  offer.user = seller;

  // Contract between seller and buyer
  if (offer.bid.code == buyer_rub_balance.asset.code && offer.price <= buyer_rub_balance.amount) {
    var contract = new Contract();
    contract.offer = offer;
    contract.seller = seller;
    contract.buyer =  buyer;
    contract.updateBalances();
  };
}
