import 'package:flutter/cupertino.dart';
import 'package:pokedex/type.dart';

class Pokemon {
  String name;
  String id;
  List<Type> types;
  String image;

  Pokemon({
    @required this.name,
    @required this.id,
    @required this.types,
    @required this.image,
  }) : assert(name != null), assert(id != null), assert(types != null), assert(image != null);

  Pokemon.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['id'] != null),
        assert(jsonMap['types'] != null),
        assert(jsonMap['image'] != null),
        name = jsonMap['name'],
        id = jsonMap['id'],
        types = jsonMap['types'],
        image = jsonMap['image'];
}
