import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {

  var user = new User("Ivan", "ivan@gmail.com", "secret");
  var balance = new Balance(asset: "usd", amount: 100, user: user);

  test("Balance constructor", () {
    expect(balance.asset.code, equals("usd"));
    expect(balance.amount, equals(100));
    expect(balance.user.name, equals("Ivan"));
  });


  test("Balance constructor", () {
    expect(balance.asset.code, equals("usd"));
    expect(balance.amount, equals(100));
    expect(balance.user.name, equals("Ivan"));
  });

  test("toString() returns text representation of balance", (){
    expect(balance.toString(), equals("Ivan usd balance is 100"));
  });
}
