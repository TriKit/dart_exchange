class Offer {
  Asset ask;
  Asset bid;
  num amount;
  num price;
  Map belongs_to = {
    'user' : null
  };

  get user {
    return belongs_to['user'];
  }

  set user(u) {
    setAssociation('user', u);
    u.offers.add(this);
  }

  void setAssociation(String name, object) {
    belongs_to[name] = object;
  }

  toString() => "${belongs_to['user'].name} offers $amount ${ask.code} for $price ${bid.code}";
}
