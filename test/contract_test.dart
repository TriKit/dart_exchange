import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var seller, buyer;
  var offer, offer2;
  var wrong_offer, wrong_offer2;
  var contract, contract2;

  var seller_rub_balance, seller_wmz_balance, seller_gbp_balance;
  var buyer_usd_balance, buyer_wmz_balance, buyer_gbp_balance;

  setUp(() {
    seller = new User("John", "john@gmail.com", "secret");
    seller_rub_balance = new Balance(asset: "rub", amount: 8000, user: seller);
    seller_gbp_balance = new Balance(asset: "gbp", amount: 0,    user: seller);
    seller_wmz_balance = new Balance(asset: "wmz", amount: 100,  user: seller);

    buyer = new User("Ivan", "ivan@gmail.com", "secret");
    buyer_usd_balance = new Balance(asset: "usd", amount: 100, user: buyer);
    buyer_wmz_balance = new Balance(asset: "wmz", amount: 0,   user: buyer);
    buyer_gbp_balance = new Balance(asset: "gbp", amount: 200, user: buyer);

    offer    = new Offer(ask: "usd", bid: "rub", amount: 30, price: 65 , user: seller);
    contract = new Contract(offer: offer, buyer: buyer);

    // wrong offers
    wrong_offer  = new Offer(ask: "eur", bid: "rub", amount: 30,  price: 70 , user: seller);
    wrong_offer2 = new Offer(ask: "usd", bid: "rub", amount: 110, price: 65 , user: seller);
  });

  test("Contract constructor", (){
    expect(contract.offer.ask.code, equals("usd"));
    expect(contract.offer.bid.code, equals("rub"));
    expect(contract.offer.amount, equals(30));
    expect(contract.offer.price, equals(65));
    expect(contract.offer.user.name, equals("John"));
    expect(contract.buyer.name, equals("Ivan"));
  });

  group("thows exception", () {
    test("if buyer don't have ask balance", () {
      expect(() => new Contract(offer: wrong_offer, buyer: buyer), throws);
    });

    test("if buyer don't have enough ask balance", () {
      expect(() => new Contract(offer: wrong_offer2, buyer: buyer), throws);
    });
  });

  group("updateBalances", () {

    test("increase seller existent balance", () {
      offer2 = new Offer(ask: "gbp", bid: "wmz", amount: 30, price: 1.5, user: seller);
      contract2 = new Contract(offer: offer2, buyer: buyer);
      contract2.updateBalances();
      expect(seller_gbp_balance.amount, equals(30));
    });

    test("increase buyer existent balance", () {
      offer2 = new Offer(ask: "gbp", bid: "wmz", amount: 30, price: 1.5, user: seller);
      contract2 = new Contract(offer: offer2, buyer: buyer);
      contract2.updateBalances();
      expect(buyer_wmz_balance.amount, equals(45));
    });

    test("create seller new balance", () {
      contract.updateBalances();
      expect(seller.getBalanceByCode(contract.offer.ask.code).asset.code, equals("usd"));
      expect(seller.getBalanceByCode(contract.offer.ask.code).amount, equals(30));
    });

    test("create buyer new balance", () {
      contract.updateBalances();
      expect(buyer.getBalanceByCode(contract.offer.bid.code).asset.code, equals("rub"));
      expect(buyer.getBalanceByCode(contract.offer.bid.code).amount, equals(1950));
    });

    test("decrease seller rub balance", () {
      contract.updateBalances();
      expect(seller_rub_balance.amount, equals(6050));
    });

    test("decrease buyer usd balance", () {
      contract.updateBalances();
      expect(buyer_usd_balance.amount, equals(70));
    });
  });

}
