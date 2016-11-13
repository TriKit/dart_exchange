part of exchange;

class Asset {
  String code, description;

  Asset(String code, String description) {
    this.code = code;
    this.description = description;
    pushNewAsset();
  }

  static var assets = [];

  include(code) {
    for (var a in assets) {
      if (a.code == code) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Asset find(code) {
    for(var a in Asset.assets) {
      if(a.code == code)
        return a;
    }
    // create new Asset
    var a = new Asset(code, null);
    // add that Asset to assets
    Asset.assets.add(a);
    // return that Asset
    return a;
  }

  pushNewAsset() {
    if (!include(this.code)) {
      assets.add(this);
    }
  }

  toString() => "$code $description";

}
