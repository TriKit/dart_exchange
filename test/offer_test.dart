import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var user, offer, balance, asset;
  setUp(() {
    user = new User("Ivan", "ivan@gmail.com", "secret");
    balance = new Balance(asset: "rub", amount: 6000, user: user);
    offer = new Offer(ask: "usd", bid: "rub", amount: 50, price: 65, user: user);
  });

  test("it creates new Offer", () {
    expect(offer.ask.code, equals("usd"));
    expect(offer.bid.code, equals("rub"));
    expect(offer.amount, equals(50));
    expect(offer.price, equals(65));
    expect(offer.user.name, equals("Ivan"));
  });
}
