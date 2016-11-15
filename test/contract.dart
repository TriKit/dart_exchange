import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  // Users
  var seller = new User("Ivan", "ivan@gmail.com", "secret");
  // add 1000 dollars to seller balance
  var seller_dollar_balance = new Balance();
  seller_dollar_balance.asset = new Asset("usd", "united states dollar");
  seller_dollar_balance.amount = 1000;
  seller_dollar_balance.user = seller;

  var buyer  = new User("John", "john@gmail.com", "secret");
  // add 10.000 rubles to buyer balance
  var buyer_rub_balance = new Balance();
  buyer_rub_balance.asset = new Asset("rub", "russian federation rubl");
  buyer_rub_balance.amount = 10000;
  buyer_rub_balance.user = buyer;

  // Offer from seller to sell 30 dollars for 2600 rubles
  var offer = new Offer(ask: "rub", bid: "usd", amount: 30, price: 1900, user: seller);

  // Create last contract
  var contract = new Contract(offer: offer, buyer: buyer);

  test("Contract constructor", (){
    expect(contract.offer.ask.code, equals("rub"));
    expect(contract.offer.bid.code, equals("usd"));
    expect(contract.offer.amount, equals(30));
    expect(contract.offer.price, equals(1900));
    expect(contract.offer.user.name, equals("Ivan"));
    expect(contract.buyer.name, equals("John"));
  });

  // group("updateBalances", () {
  //   test("it updates", () {
  //     contract.updateBalances();
  //     expect(contract.belongs_to["seller"].associations["balances"].last.asset.code, equals("rub"));
  //     expect(contract.belongs_to["seller"].associations["balances"].last.amount, equals(1900));
  //     expect(contract.belongs_to["seller"].associations["balances"].first.asset.code, equals("usd"));
  //     expect(contract.belongs_to["seller"].associations["balances"].first.amount, equals(970));
  //
  //     expect(contract.belongs_to["buyer"].associations["balances"].first.asset.code, equals("rub"));
  //     expect(contract.belongs_to["buyer"].associations["balances"].first.amount, equals(8100));
  //     expect(contract.belongs_to["buyer"].associations["balances"].last.asset.code, equals("usd"));
  //     expect(contract.belongs_to["buyer"].associations["balances"].last.amount, equals(30));
  //   });
  // });
}
