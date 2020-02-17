import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/resources/icons_assets.dart';

enum Type {
  grass, water, fire, poison, flying, bug, normal, electric
}

extension TypeExtension on Type {
  Color get color {
    switch (this) {
      case Type.bug :
        return Colors.lime;
      case Type.electric :
        return Colors.yellow;
      case Type.fire :
        return Colors.red;
      case Type.flying :
        return Colors.blueAccent;
      case Type.grass :
        return Colors.green;
      case Type.normal :
        return Colors.grey;
      case Type.poison :
        return Colors.purple;
      case Type.water :
        return Colors.blue.shade800;
      default :
        return null;
    }
  }

  String get name {
    switch (this) {
      case Type.bug :
        return 'Bug';
      case Type.electric :
        return 'Electric';
      case Type.fire :
        return 'Fire';
      case Type.flying :
        return 'Flying';
      case Type.grass :
        return 'Grass';
      case Type.normal :
        return 'Normal';
      case Type.poison :
        return 'Poison';
      case Type.water :
        return 'Water';
      default :
        return null;
    }
  }

  String get icon {
    switch (this) {
      case Type.bug :
        return IconsAssets.bug;
      case Type.electric :
        return IconsAssets.electric;
      case Type.fire :
        return IconsAssets.fire;
      case Type.flying :
        return IconsAssets.flying;
      case Type.grass :
        return IconsAssets.grass;
      case Type.normal :
        return IconsAssets.normal;
      case Type.poison :
        return IconsAssets.poison;
      case Type.water :
        return IconsAssets.water;
      default :
        return null;
    }
  }
}