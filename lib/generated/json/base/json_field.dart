/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function :
class JsonSerializable{
  const JsonSerializable();
}

class JSONField {
  //Specify the parse field name
  final String? name;

  //Whether to participate in toJson
  final bool? serialize;

  //Whether to participate in fromMap
  final bool? deserialize;

  //Enumeration or not
  final bool? isEnum;

  const JSONField({this.name, this.serialize, this.deserialize, this.isEnum});
}
