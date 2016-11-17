part of exchange;

class Balance {
  Asset asset;
  num amount;
  Map belongs_to = {
    "user" : null
  };

<<<<<<< HEAD
  // Balance({asset: null, amount: null, user: null}) {
  //   this.asset = Asset.find(asset);
  //   this.amount = amount;
  //   this.belongs_to["user"] = user;
  // }
=======
  Balance({asset: null, amount: null, user: null}) {
    this.asset = Asset.find(asset);
    this.amount = amount;
    this.belongs_to["user"] = user;
  }
>>>>>>> 436a8b0627407d67dffd33e1f8aef7a6e5d225f7

  get user {
    return belongs_to["user"];
  }

  set user(u) {
    setAssociation("user", u);
    u.balances.add(this);
  }

  void setAssociation(String name, object) {
    belongs_to[name] = object;
  }

  toString() => "${belongs_to['user'].name} ${asset.code} balance is $amount";
}
