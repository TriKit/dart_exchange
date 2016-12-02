part of exchange;

class Asset {
  String code, description;

  Asset(String code, String description) {
    this.code = code;
    this.description = description;
    pushNewAsset();
  }

  static var assets = [];

  bool include(code) {
    for (var a in assets) {
      if(a.code == code)
        return true;
    }
    return false;
  }

  static Asset find(c) {
    for(var a in Asset.assets) {
      if(a.code == c)
        return a;
    }
    var a = new Asset(c, null);
    Asset.assets.add(a);
    return a;
  }


  pushNewAsset() {
    if(!include(this.code))
      Asset.assets.add(this);
  }

}
