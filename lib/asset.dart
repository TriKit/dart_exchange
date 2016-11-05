import 'user.dart';

class Asset {
  String code, name;
  Asset(this.code, this.name);
  toString() => "$name $code";
}
