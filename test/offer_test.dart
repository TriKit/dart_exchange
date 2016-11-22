import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var user, offer;
  setUp(() {
    user = new User("Ivan", "ivan@gmail.com", "secret");
    new Balance(asset: "rub", amount: 6000, user: user);
    offer = new Offer(ask: "usd", bid: "rub", amount: 50, price: 65, user: user);
  });

  test("it creates new Offer", () {
    expect(offer.ask.code, equals("usd"));
    expect(offer.bid.code, equals("rub"));
    expect(offer.amount, equals(50));
    expect(offer.price, equals(65));
    expect(offer.user.name, equals("Ivan"));
  });

  test("it throws exception if bid balance doesn't exists", () {
    expect(() => new Offer(ask: "usd", bid: "eur", amount: 50, price: 1.2, user: user), throws);
  });

  test("it throws exception if bid balance isn't enough", () {
    expect(() => new Offer(ask: "usd", bid: "rub", amount: 250, price: 65, user: user), throws);
  });
}
