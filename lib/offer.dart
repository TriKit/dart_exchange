class Offer {
  User _user;
  Asset asset;
  num amount;
  Offer(this.user, this.asset, this.amount);

  get user => _user;
  set user(u) {
    _user = u;
    _user.offers.add(this);
  }
}
