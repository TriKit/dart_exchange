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
    var a = new Asset(code, null);
    Asset.assets.add(a);
    return a;
  }


  pushNewAsset() {
    if(!include(this.code)) {
      Asset.assets.add(this);
    }
  }

}
