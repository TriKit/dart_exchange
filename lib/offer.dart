part of exchange;

class Offer {
  Asset ask, bid;
  num amount, price;
  Map belongs_to = {
    'user' : null
  };

  // amount - количество продаваемого товара, price - цена за единицу товара
  Offer({ String ask: null, String bid: null, amount: null, price: null, user: null}) {
     if (!user.balanceExists(bid) || user.getBalanceByCode(bid).amount < amount*price) {
       throw new Exception("You currentrly have not enough balance");
     }
     else {
       this.ask = Asset.find(ask);
       this.bid = Asset.find(bid);
       this.amount = amount;
       this.price = price;
       this.belongs_to["user"] = user;
       this.belongs_to["user"].addOffer(this);
     }
  }

  get user {
    return belongs_to["user"];
  }

  set user(u) {
    setAssociation("user", u);
    u.offers.add(this);
  }

  void setAssociation(String name, object) {
    belongs_to[name] = object;
  }

  toString() => "${this.belongs_to['user'].name} offers ${this.price*this.amount} ${this.bid.code} for ${this.amount} ${this.ask.code}";
}
