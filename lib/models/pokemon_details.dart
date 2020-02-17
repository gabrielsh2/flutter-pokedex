import 'package:pokedex/models/stats.dart';
import 'package:pokedex/type.dart';

class PokemonDetails {
  final String name;
  final String id;
  final List<Type> types;
  final String image;
  final List<Stats> stats;
  final String description;

  static List<Type> _getTypeList(List<dynamic> types) {
    List<Type> _types = [];
    types.forEach((type) {
      Type _type =
          Type.values.firstWhere((e) => e.toString() == 'Type.' + type);
      _types.add(_type);
    });
    return _types;
  }

  PokemonDetails.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['id'] != null),
        assert(jsonMap['types'] != null),
        assert(jsonMap['image'] != null),
        assert(jsonMap['stats'] != null),
        assert(jsonMap['description'] != null),
        name = jsonMap['name'],
        id = jsonMap['id'],
        types = jsonMap['types']
            .map<Type>((type) =>
                Type.values.firstWhere((e) => e.toString() == 'Type.' + type))
            .toList(),
        image = jsonMap['image'],
        stats = jsonMap['stats']
            .map<Stats>((stat) => Stats.fromJson(stat))
            .toList(),
        description = jsonMap['description'];
}
