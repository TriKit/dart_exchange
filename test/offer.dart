import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var user, offer, balance, asset;
  setUp(() {
    user = new User("Ivan", "ivan@gmail.com", "secret");
    asset = new Asset("usd", "unated states dollar");
    balance = new Balance();
    balance.asset = asset;
    balance.amount = 100;
    balance.user = user;
    offer = new Offer(bid: "usd", ask: "rub", amount: 50, price: 3200, user: user);
  });

  test("it creates new Offer", () {
    expect(offer.ask.code, equals("rub"));
    expect(offer.bid.code, equals("usd"));
    expect(offer.amount, equals(50));
    expect(offer.price, equals(3200));
    expect(offer.user.name, equals("Ivan"));
  });
}
