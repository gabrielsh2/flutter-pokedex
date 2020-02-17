class Stats {
  final String name;
  final int value;

  static String _mapNameValues(String name) {
    switch(name) {
      case 'hp':
        return 'hp';
      case 'attack':
        return 'atk';
      case 'defense':
        return 'def';
      case 'special-attack':
        return 'satk';
      case 'special-defense':
        return 'sdef';
      case 'speed':
        return 'spd';
    }
  }

  Stats.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['value'] != null),
        name = _mapNameValues(jsonMap['name']),
        value = jsonMap['value'];
}
