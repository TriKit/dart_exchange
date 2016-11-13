import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var user = new User('Ivan', 'ivan@gmail.com', 'secret');
  var user_balance = new Balance();
  user_balance.asset = new Asset('usd', 'united states dollar');
  user_balance.amount = 100;
  user_balance.user = user;

  group("balanceExists()", () {
    test("it returns true if balance exists", () {
      expect(user.balanceExists('usd'), equals(true));
    });

    test("it returns false if balance doesn't exist", () {
      expect(user.balanceExists('rub'), equals(false));
    });
  });

  group("getBalanceByCode()", () {
    test("it returns balance if it exists", () {
      expect(user.getBalanceByCode('usd'), equals(user_balance));
    });

    test("it returns null if balance doesn't exist", () {
      expect(user.getBalanceByCode('rub'), equals(null));
    });
  });
}
