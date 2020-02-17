import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex/type.dart';

class AnimationPage extends StatelessWidget {
  AnimationPage({
    Key key,
    @required this.pokemon,
  })  : assert(pokemon != null),
        super(key: key);

  final Pokemon pokemon;

  Color _getMainColor() {
    return pokemon.types[0].color;
  }

  String _getCapitalizedPokemonName() {
    return '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => PokemonDetailsPage(
            color: _getMainColor(),
            name: _getCapitalizedPokemonName(),
            id: pokemon.id,
            image: Image.network(pokemon.image),
            types: pokemon.types,
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: _getMainColor(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Hero(
            tag: pokemon.name,
            child: Image.network(
              pokemon.image,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
