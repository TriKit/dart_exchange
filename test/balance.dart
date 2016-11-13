import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var user = new User('Ivan', 'ivan@gmail.com', 'secret');
  var balance = new Balance();
  balance.asset = new Asset('usd', 'united states dollar');
  balance.amount = 100;
  balance.user = user;

  test("toString() returns text representation of balance", (){
    expect(balance.toString(), equals("Ivan usd balance is 100"));
  });
}
