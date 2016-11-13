// import 'balance.dart';
// import 'asset.dart';
part of exchange;

class Contract {
  Offer offer;
  Map belongs_to = {
    "seller" : null,
    "buyer"  : null
  };

  get seller => belongs_to["seller"];
  get buyer => belongs_to["buyer"];

  set seller(s) {
    setAssociation("seller", s);
    s.contracts.add(this);
  }

  set buyer(b) {
    setAssociation("buyer", b);
    b.contracts.add(this);
  }

  void setAssociation(String name, object) {
    belongs_to[name] = object;
  }

  void updateBalances() {
    // Show initial users data
    print(this.belongs_to["seller"].associations['balances']);
    print(this.belongs_to["buyer"].associations['balances']);
    print(offer);
    print("----------------------------");
    // Increase seller wished balance
      // if wished balance exists
    if (belongs_to["seller"].balanceExists(offer.bid.code)) {
      this.belongs_to["seller"].getBalanceByCode(offer.bid).amount += offer.price;
    } else {
      // create new balance for seller
      var wish_balance = new Balance();
      wish_balance.asset = new Asset(this.offer.bid.code, this.offer.bid.description);
      wish_balance.amount = this.offer.price;
      wish_balance.user = this.belongs_to["seller"];
      print(wish_balance);
    }
    // Decrease seller proposed balance
    this.belongs_to["seller"].getBalanceByCode(offer.ask.code).amount -= offer.amount;

    // Show seller balances
    print(belongs_to["seller"].getBalanceByCode(offer.ask.code));
    print("----------------------------");

    // Increase buyer proposed balance
      // if proposed balance exists
    if (belongs_to["buyer"].balanceExists(offer.ask.code)) {
      this.belongs_to["buyer"].getBalanceByCode(offer.ask.code).amount += offer.amount;
      print(belongs_to["buyer"].getBalanceByCode(offer.ask.code));
    } else {
      // create new balance for buyer
      var proposed_balance = new Balance();
      proposed_balance.asset = new Asset(offer.ask.code, offer.ask.description);
      proposed_balance.amount = offer.amount;
      proposed_balance.user = this.belongs_to["buyer"];
      print(proposed_balance);
    }
    // Decrease buyer wished balance
    belongs_to["buyer"].getBalanceByCode(offer.bid.code).amount -= offer.price;

    // Show bayer balances
    print(belongs_to["buyer"].getBalanceByCode(offer.bid.code));

    print(this.belongs_to["seller"].associations['balances']);
    print(this.belongs_to["buyer"].associations['balances']);
  }

}
