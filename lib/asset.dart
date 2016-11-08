class Asset {
  String code, description;
  Asset(this.code, this.description);
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

  void pushNewAsset() {
    if (!include(this.code)) {
      assets.add(this);
    }
  }

  toString() => "$code $description";

}
