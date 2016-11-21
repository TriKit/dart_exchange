part of exchange;

class Contract {
  Offer offer;
  Map belongs_to = {
    "seller" : null,
    "buyer"  : null
  };

  Contract({offer: null, buyer: null}) {
    if (!buyer.balanceExists(offer.ask.code)) {
      throw new Exception("You don't have balance");
    } else if (buyer.balanceExists(offer.ask.code) && buyer.getBalanceByCode(offer.ask.code).amount < offer.amount) {
      throw new Exception("Your ${offer.ask.code} balance is not enough");
    } else {
      this.offer = offer;
      this.belongs_to["seller"] = offer.user;
      this.belongs_to["buyer"] = buyer;
      this.belongs_to["seller"].addContract(this);
      this.belongs_to["buyer"].addContract(this);
    }
  }

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
    increaseSellerAskBalance();
    increaseBuyerBidBalance();

    decreaseSellerBidBalance();
    decreaseBuyerAskBalance();

    showInfo();
  }

  increaseSellerAskBalance() {
    if(this.offer.user.balanceExists(offer.ask.code)) {
      this.offer.user.getBalanceByCode(offer.ask.code).amount += offer.price;
    } else {
      var ask_balance = new Balance();
      ask_balance.amount = this.offer.amount;
    }
  }

  increaseBuyerBidBalance() {
    if(this.buyer.balanceExists(this.offer.bid.code)) {
      this.buyer.getBalanceByCode(this.offer.bid.code).amount += offer.amount;
    } else {
    var bid_balance = new Balance();
    bid_balance.asset = new Asset(this.offer.bid.code, this.offer.bid.description);
    bid_balance.amount = this.offer.price;
    bid_balance.user = buyer;
    }
  }

  decreaseSellerBidBalance() {
    this.offer.user.getBalanceByCode(this.offer.bid.code).amount -= offer.amount;
  }

  decreaseBuyerAskBalance() {
    this.buyer.getBalanceByCode(this.offer.ask.code).amount -= offer.amount*offer.price;
  }

  void showInfo() {
    print(buyer.getBalanceByCode(this.offer.bid.code));
    print(buyer.getBalanceByCode(this.offer.ask.code));
    print("---------------------------------------");
    print(this.offer.user.name);
    print(this.offer.user.getBalanceByCode(offer.bid.code));
    print(this.offer.user.getBalanceByCode(offer.ask.code));
  }

}
