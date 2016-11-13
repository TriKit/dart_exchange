part of exchange;

class Balance {
  Asset asset;
  num amount;
  Map belongs_to = {
    'user' : null
  };

  get user {
    return belongs_to['user'];
  }

  set user(u) {
    setAssociation('user', u);
    u.balances.add(this);
  }

  void setAssociation(String name, object) {
    belongs_to[name] = object;
  }

  toString() => "${belongs_to['user'].name} ${asset.code} balance is $amount";
}
