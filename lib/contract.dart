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
    if(this.offer.user.balanceExists(this.offer.ask.code)) {
      this.offer.user.getBalanceByCode(this.offer.ask.code).amount += this.offer.amount;
    } else {
      new Balance(asset: this.offer.ask.code, amount: this.offer.amount, user: this.offer.user);
    }
  }

  increaseBuyerBidBalance() {
    if(this.buyer.balanceExists(this.offer.bid.code)) {
      this.buyer.getBalanceByCode(this.offer.bid.code).amount += offer.amount*offer.price;
    } else {
      new Balance(asset: this.offer.bid.code, amount: this.offer.amount*this.offer.price, user: this.buyer);
    }
  }

  decreaseSellerBidBalance() {
    this.offer.user.getBalanceByCode(this.offer.bid.code).amount -= offer.amount*offer.price;
  }

  decreaseBuyerAskBalance() {
    this.buyer.getBalanceByCode(this.offer.ask.code).amount -= offer.amount;
  }

  void showInfo() {
    print("""
      ${this.offer}
      ${this.offer.user.name} ${this.offer.bid.code} balance is ${seller.getBalanceByCode(this.offer.bid.code).amount}
      ${this.offer.user.name} ${this.offer.ask.code} balance is ${seller.getBalanceByCode(this.offer.ask.code).amount}
      ------------------------------------
      ${this.buyer.name} ${this.offer.bid.code} balance is ${this.buyer.getBalanceByCode(this.offer.bid.code).amount}
      ${this.buyer.name} ${this.offer.ask.code} balance is ${this.buyer.getBalanceByCode(this.offer.ask.code).amount}
    """);
  }

}
