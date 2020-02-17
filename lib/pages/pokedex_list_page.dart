import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/repositories/api.dart';
import 'package:pokedex/type.dart';
import 'package:pokedex/widgets/loader.dart';
import 'package:pokedex/widgets/pokedex_card.dart';

class PokedexListPage extends StatefulWidget {
  PokedexListPage({Key key}) : super(key: key);

  @override
  _PokedexListPageState createState() => _PokedexListPageState();
}

class _PokedexListPageState extends State<PokedexListPage> {
  List<Pokemon> _pokemonList = [];
  bool _isLoading = false;
  String _url = 'http://localhost:3000/list';

  _getPokemonList() async {
    setState(() {
      _isLoading = true;
    });
    var response = await Request.get(_url);

    response['pokemons'].forEach((pokemon) {
      List<Type> types = [];
      pokemon['types'].forEach((type) {
        Type _type =
            Type.values.firstWhere((e) => e.toString() == 'Type.' + type);
        types.add(_type);
      });

      Pokemon _pokemon = Pokemon(
        name: pokemon['name'],
        id: pokemon['id'],
        image: pokemon['image'],
        types: types,
      );

      _pokemonList.add(_pokemon);
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue, Colors.green]),
            ),
            height: 4.0,
          ),
        ),
        title: Center(
          child: Text(
            'Pokemon',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: _isLoading
              ? Center(
                  child: Loader(),
                )
              : ListView.separated(
                  itemBuilder: (BuildContext context, int index) => PokedexCard(
                    pokemon: _pokemonList[index],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(227, 227, 227, 1.0),
                        ),
                      ),
                    ),
                  ),
                  itemCount: _pokemonList.length,
                ),
        ),
      ),
    );
  }
}
