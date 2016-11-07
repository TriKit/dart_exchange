import 'balance.dart';
import 'asset.dart';

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
    if (belongs_to["seller"].balanceExists(offer.wish_asset.code)) {
      this.belongs_to["seller"].getBalanceByCode(offer.wish_asset).amount += offer.wish_amount;
    } else {
      // create new balance for seller
      var wish_balance = new Balance();
      wish_balance.asset = new Asset(this.offer.wish_asset.code, this.offer.wish_asset.description);
      wish_balance.amount = this.offer.wish_amount;
      wish_balance.user = this.belongs_to["seller"];
      print(wish_balance);
    }
    // Decrease seller proposed balance
    this.belongs_to["seller"].getBalanceByCode(offer.proposed_asset.code).amount -= offer.proposed_amount;

    // Show seller balances
    print(belongs_to["seller"].getBalanceByCode(offer.proposed_asset.code));
    print("----------------------------");

    // Increase buyer proposed balance
      // if proposed balance exists
    if (belongs_to["buyer"].balanceExists(offer.proposed_asset.code)) {
      this.belongs_to["buyer"].getBalanceByCode(offer.proposed_asset.code).amount += offer.proposed_amount;
      print(belongs_to["buyer"].getBalanceByCode(offer.proposed_asset.code).amount);
    } else {
      // create new balance for buyer
      var proposed_balance = new Balance();
      proposed_balance.asset = new Asset(offer.proposed_asset.code, offer.proposed_asset.description);
      proposed_balance.amount = offer.proposed_amount;
      proposed_balance.user = this.belongs_to["buyer"];
      print(proposed_balance);
    }
    // Decrease buyer wished balance
    belongs_to["buyer"].getBalanceByCode(offer.wish_asset.code).amount -= offer.wish_amount;

    // Show bayer balances
    print(belongs_to["buyer"].getBalanceByCode(offer.wish_asset.code));
  }

}
