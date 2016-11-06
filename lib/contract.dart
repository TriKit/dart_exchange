import 'balance.dart';
import 'asset.dart';

class Contract {
  Offer offer_to_sell;
  Map belongs_to = {
    'seller' : null,
    'buyer'  : null
  };

  get seller => belongs_to['seller'];
  get buyer => belongs_to['buyer'];

  set seller(s) {
    setAssociation('seller', s);
    s.contracts.add(this);
  }

  set buyer(b) {
    setAssociation('buyer', b);
    b.contracts.add(this);
  }

  void setAssociation(String name, object) {
    belongs_to[name] = object;
  }


  void increaseSellerBalance() {
    for (var balance in belongs_to['seller'].balances) {
      if (balance.asset.code == offer_to_sell.wish_asset.code) {
        balance.amount += offer_to_sell.wish_amount;
        print("${belongs_to['seller'].name}s ${offer_to_sell.wish_asset.code} balance increased by ${offer_to_sell.wish_amount}");
        decreaseSellerBalance();
        break;
      } else {
        var new_balance = new Balance();
        new_balance.asset = new Asset(offer_to_sell.wish_asset.code, offer_to_sell.wish_asset.description);
        new_balance.amount = offer_to_sell.wish_amount;
        new_balance.user = this.belongs_to['seller'];
        print("${belongs_to['seller'].name}s ${offer_to_sell.wish_asset.code} balance created and increased by ${offer_to_sell.wish_amount}");
        decreaseSellerBalance();
        break;
      }
    }
  }

  void increaseBuyerBalance() {
    for (var balance in belongs_to['buyer'].balances) {
      if (balance.asset.code == offer_to_sell.proposed_asset.code) {
        balance.amount += offer_to_sell.proposed_amout;
        print("${belongs_to['buyer'].name}s ${offer_to_sell.proposed_asset.code} balance increased by ${offer_to_sell.proposed_amount}");
        decreaseBuyerBalance();
        break;
      } else {
        var new_balance = new Balance();
        new_balance.asset = new Asset(offer_to_sell.wish_asset.code, offer_to_sell.wish_asset.description);
        new_balance.amount = offer_to_sell.wish_amount;
        new_balance.user = this.belongs_to['seller'];
        print("${belongs_to['buyer'].name}s ${offer_to_sell.proposed_asset.code} balance created and increased by ${offer_to_sell.proposed_amount} ");
        decreaseBuyerBalance();
        break;
      }
    }
  }

  void decreaseSellerBalance() {
    for (var balance in belongs_to['seller'].balances) {
      if (balance.asset.code == offer_to_sell.proposed_asset.code) {
        balance.amount -= offer_to_sell.proposed_amount;
        print("${belongs_to['seller'].name}s ${offer_to_sell.proposed_asset.code} balance decreased by ${offer_to_sell.proposed_amount}");
        print(balance);
      }
    }
  }


  void decreaseBuyerBalance() {
    for (var balance in belongs_to['buyer'].balances) {
      if (balance.asset.code == offer_to_sell.wish_asset.code) {
        balance.amount -= offer_to_sell.wish_amount;
        print("${belongs_to['buyer'].name}s ${offer_to_sell.wish_asset.code} balance decreased by ${offer_to_sell.wish_amount}");
        print(balance);
      }
    }
  }

}
