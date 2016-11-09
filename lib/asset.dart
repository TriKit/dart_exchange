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

  pushNewAsset() {
    if (!include(this.code)) {
      assets.add(this);
    }
  }

  toString() => "$code $description";

}
