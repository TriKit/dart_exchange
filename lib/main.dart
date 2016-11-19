import 'exchange.dart';

main() {
  var seller = new User("Ivan", "ivan@gmail.com", "secret");
  var buyer  = new User("John", "john@gmail.com", "secret");

  var seller_balance = new Balance(asset: "rub", amount: 10000, user: seller);
  print(seller.associations["balances"]);
  var buyer_balance = new Balance(asset: "usd", amount: 100, user: buyer);
  print(buyer.associations["balances"]);
  var offer = new Offer(ask: "usd", bid: "rub", amount: 40, price: 65, user: seller);
  print(offer);

  var contract = new Contract(offer: offer, buyer: buyer);
  // contract.updateBalances();
}
