import "package:test/test.dart";
import "../lib/exchange.dart";

void main() {
  var user = new User({"name" : "Ivan", "email" : "ivan@gmail.com", "password" : "secret"});
  var user_balance = new Balance(asset: "usd", amount: 100, user: user);

  test("it sets and saves properties", () {
    user.name = "Sergey";
    user.saveProperties("test/props/user.json").then((data) {
      user.loadProperties("test/props/user.json").then((d){
        expect(user.name, equals("Sergey"));
      });
    });
  });

  group("balanceExists()", () {
    test("it returns true if balance exists", () {
      expect(user.balanceExists("usd"), equals(true));
    });

    test("it returns false if balance doesn't exist", () {
      expect(user.balanceExists("rub"), equals(false));
    });
  });

  group("getBalanceByCode()", () {
    test("it returns balance if it exists", () {
      expect(user.getBalanceByCode("usd"), equals(user_balance));
    });

    test("it returns null if balance doesn't exist", () {
      expect(user.getBalanceByCode("rub"), equals(null));
    });
  });
}
