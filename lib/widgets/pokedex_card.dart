import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/pages/animation.dart';
import 'package:pokedex/pages/pokemon_details_page.dart';
import 'package:pokedex/type.dart';
import 'package:pokedex/widgets/loader.dart';

class PokedexCard extends StatelessWidget {
  PokedexCard({
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

  void _pushPokemonDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => AnimationPage(
          pokemon: pokemon,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: _getMainColor(),
      highlightColor: _getMainColor(),
      onTap: () => _pushPokemonDetails(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
        child: Container(
          width: double.infinity,
          height: 80,
          child: Row(
            children: <Widget>[
              Hero(
                tag: pokemon.name,
                child: Image.network(
                  pokemon.image,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: Loader(),
                    );
                  },
                  height: 70,
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _getCapitalizedPokemonName(),
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(79, 79, 79, 1.0),
                    ),
                  ),
                  Text(
                    '#' + pokemon.id.padLeft(3, '0'),
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(164, 164, 164, 1.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: pokemon.types
                    .map(
                      (Type type) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: type.color,
                          ),
                          child: Image.asset(
                            type.icon,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
