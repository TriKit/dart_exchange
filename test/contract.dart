import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {

  var seller, buyer, offer, contract, seller_rub_balance, buyer_usd_balance;

  setUp(() {
    seller = new User("John", "john@gmail.com", "secret");
    // add 10.000 rubles to seller balance
    seller_rub_balance = new Balance();
    seller_rub_balance.asset = new Asset("rub", "russian federation rubl");
    seller_rub_balance.amount = 7000;
    seller_rub_balance.user = seller;

    buyer = new User("Ivan", "ivan@gmail.com", "secret");
    // add 1000 dollars to buyer balance
    buyer_usd_balance = new Balance();
    buyer_usd_balance.asset = new Asset("usd", "united states dollar");
    buyer_usd_balance.amount = 100;
    buyer_usd_balance.user = buyer;

    // Offer from seller to sell 30 dollars for 1900 rubles
    offer = new Offer(ask: "usd", bid: "rub", amount: 30, price: 1900, user: seller);
    // Create last contract
    contract = new Contract(offer: offer, buyer: buyer);
  });

  test("Contract constructor", (){
    expect(contract.offer.ask.code, equals("usd"));
    expect(contract.offer.bid.code, equals("rub"));
    expect(contract.offer.amount, equals(30));
    expect(contract.offer.price, equals(1900));
    expect(contract.offer.user.name, equals("John"));
    expect(contract.buyer.name, equals("Ivan"));
  });

  group("updateBalances", () {
    test("increase seller rub balance if it exists", () {

    });

    test("increase buyer usd balance if it exists", () {

    });

    test("create seller usd balance", () {
      contract.updateBalances();
      expect(contract.offer.user.getBalanceByCode(contract.offer.ask.code), equals("usd"));
      expect(contract.offer.user.getBalanceByCode(contract.offer.ask.code).amount, equals(30));
    });

    test("create buyer rub balance", () {
      contract.updateBalances();
      expect(buyer.getBalanceByCode(contract.offer.ask.code), equals("rub"));
      expect(buyer.getBalanceByCode(contract.offer.ask.code).amount, equals(1900));
    });

    test("decrease seller rub balance", () {
      contract.updateBalances();
      expect(contract.offer.user.getBalanceByCode(contract.offer.bid.code).amount, equals(5100));
    });

    test("decrease buyer usd balance", () {
      contract.updateBalances();
      expect(contract.buyer.getBalanceByCode(contract.offer.ask.code).amount, equals(70));
    });
  });

}
