class Offer {
  Asset proposed_asset;
  Asset wish_asset;
  num proposed_amount;
  num wish_amount;
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

  toString() => "${belongs_to['user'].name} offers $proposed_amount ${proposed_asset.code} for $wish_amount ${wish_asset.code}";
}
