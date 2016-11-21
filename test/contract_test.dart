import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {

  var seller, buyer, offer, contract, seller_rub_balance, buyer_usd_balance;

  setUp(() {
    seller = new User("John", "john@gmail.com", "secret");
    seller_rub_balance = new Balance(asset: "rub", amount: 7000, user: seller);

    buyer = new User("Ivan", "ivan@gmail.com", "secret");
    buyer_usd_balance = new Balance(asset: "usd", amount: 100, user: buyer);

    offer = new Offer(ask: "usd", bid: "rub", amount: 30, price: 65 , user: seller);
    contract = new Contract(offer: offer, buyer: buyer);
  });

  test("Contract constructor", (){
    expect(contract.offer.ask.code, equals("usd"));
    expect(contract.offer.bid.code, equals("rub"));
    expect(contract.offer.amount, equals(30));
    expect(contract.offer.price, equals(65));
    expect(contract.offer.user.name, equals("John"));
    expect(contract.buyer.name, equals("Ivan"));
  });

  // test("thows exeption if user don't have enough balance", () {
  //   expect(() => new Contract(offer: offer, buyer: buyer), throws);
  // });

  // group("updateBalances", () {
  //
  //
  //   test("increase seller rub balance if it exists", () {
  //
  //   });
  //
  //   test("increase buyer usd balance if it exists", () {
  //
  //   });
  //
  //   test("create seller usd balance", () {
  //     contract.updateBalances();
  //     expect(contract.offer.user.getBalanceByCode(contract.offer.ask.code), equals("usd"));
  //     expect(contract.offer.user.getBalanceByCode(contract.offer.ask.code).amount, equals(2000));
  //   });
  //
  //   test("create buyer rub balance", () {
  //     contract.updateBalances();
  //     expect(buyer.getBalanceByCode(contract.offer.ask.code), equals("rub"));
  //     expect(buyer.getBalanceByCode(contract.offer.ask.code).amount, equals(0.015));
  //   });
  //
  //   test("decrease seller rub balance", () {
  //     contract.updateBalances();
  //     expect(contract.offer.user.getBalanceByCode(contract.offer.bid.code).amount, equals(5000));
  //   });
  //
  //   test("decrease buyer usd balance", () {
  //     contract.updateBalances();
  //     expect(contract.buyer.getBalanceByCode(contract.offer.ask.code).amount, equals(70));
  //   });
  // });

}
