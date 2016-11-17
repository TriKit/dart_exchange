import 'exchange.dart';

main() {
  // Users
  var seller = new User("Ivan", "ivan@gmail.com", "secret");
  var buyer  = new User("John", "john@gmail.com", "secret");

  // add 100 dollars to seller balance
  // var seller_balance = new Balance(asset: "rub", amount: 10000, user:
  // seller);
  var seller_balance = new Balance();
  seller_balance.asset  = new Asset("rub", "russian federation rubl");
  seller_balance.amount = 10000;
  seller_balance.user   = seller;

  // add 10.000 rubles to buyer balance
  // var buyer_balance = new Balance(asset: "usd", amount: 100, user: buyer);
  var buyer_balance = new Balance();
  buyer_balance.asset  = new Asset("usd", "united states dollar");
  buyer_balance.amount = 100;
  buyer_balance.user   = buyer;

  // Offer from seller to sell 40 dollars for 2700 rubles
  var offer = new Offer(ask: "usd", bid: "rub", amount: 40, price: 2700, user: seller);
  print(offer);

  // Contract between seller and buyer

  var contract = new Contract(offer: offer, buyer: buyer);
  contract.updateBalances();
}
