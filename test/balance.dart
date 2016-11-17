import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
<<<<<<< HEAD
  var user = new User('Ivan', 'ivan@gmail.com', 'secret');
  // var balance = new Balance(asset: "usd", amount: 100, user: user);
  var balance = new Balance();
  balance.asset = new Asset('usd', 'united states dollar');
  balance.amount = 100;
  balance.user = user;
=======
  var user = new User("Ivan", "ivan@gmail.com", "secret");
  var balance = new Balance(asset: "usd", amount: 100, user: user);

  test("Balance constructor", () {
    expect(balance.asset.code, equals("usd"));
    expect(balance.amount, equals(100));
    expect(balance.user.name, equals("Ivan"));
  });
>>>>>>> 436a8b0627407d67dffd33e1f8aef7a6e5d225f7

  test("Balance constructor", () {
    expect(balance.asset.code, equals("usd"));
    expect(balance.amount, equals(100));
    expect(balance.user.name, equals("Ivan"));
  });

  test("toString() returns text representation of balance", (){
    expect(balance.toString(), equals("Ivan usd balance is 100"));
  });
}
