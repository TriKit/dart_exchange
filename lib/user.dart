class User {
  String name, email, password;
  Map associations = {
    "balances" : [],
    "offers" : [],
    "contracts" : []
  };

  get balances => associations['balances'];
  get offers => associations['offers'];
  get contracts => associations['contracts'];

  User(this.name, this.email, this.password);

  void addBalance(Balance balance) {
    _addAssociation('balances', object);
  }

  void addOffer(Offer offer) {
    _addAssociation('offers', object);
  }

  void addContract(Contract offer) {
    _addAssociation('contracts', object);
  }

  void _addAssociation(String name, object) {
    associations[name].add(object);
    object.setAssociation(name, this);
  }
}

//setAssociation
