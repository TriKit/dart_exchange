part of exchange;

class User extends Model {
  Map properties = { "name" : null, "password" : null, "email": null };

  Map associations = {
    "balances" : [],
    "offers" : [],
    "contracts" : []
  };

  User(properties);

  get balances => associations["balances"];
  get offers => associations["offers"];
  get contracts => associations["contracts"];

  void addBalance(Balance object) {
    _addAssociation("balances", object);
  }

  void addOffer(Offer object) {
    _addAssociation("offers", object);
  }

  void addContract(Contract object) {
    _addAssociation("contracts", object);
  }

  void _addAssociation(String name, object) {
    associations[name].add(object);
    object.setAssociation(name, this);
  }

  bool balanceExists(String code) {
    for (var balance in associations["balances"]) {
      if(code == balance.asset.code)
        return true;
    }
    return false;
  }

  getBalanceByCode(code) {
    for (var balance in associations["balances"]) {
      if(code == balance.asset.code)
        return balance;
    }
    return null;
  }
}
