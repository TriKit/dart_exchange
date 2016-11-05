import 'user.dart';

class Asset {
  int id;
  String name, description;
  Asset(this.id, this.name, this.description);
  toString() => "id:$id, $name $description";
}
