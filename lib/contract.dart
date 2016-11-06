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

  void updateBalance(role, assetCode, amount) {
    
  }

  toString() => "Contract between ${belongs_to['seller'].name} and ${belongs_to['buyer'].name}. ${belongs_to['seller'].name} sold ${offer_to_sell.proposed_amount} ${offer_to_sell.proposed_asset.code} to ${belongs_to['buyer'].name} for ${offer_to_sell.wish_amount} ${offer_to_sell.wish_asset.code}";
}
