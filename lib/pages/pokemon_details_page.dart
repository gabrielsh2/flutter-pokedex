import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/repositories/api.dart';
import 'package:pokedex/type.dart';
import 'package:pokedex/widgets/loader.dart';
import 'package:pokedex/widgets/stat_bar.dart';
import 'package:pokedex/widgets/type_display.dart';

class PokemonDetailsPage extends StatefulWidget {
  PokemonDetailsPage({
    @required this.color,
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.types,
    Key key,
  })  : assert(color != null),
        assert(name != null),
        assert(id != null),
        assert(image != null),
        assert(types != null),
        super(key: key);

  final Color color;
  final String name;
  final String id;
  final Image image;
  final List<Type> types;

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  final String url = 'http://localhost:3000/details/';
  PokemonDetails pokemonDetails;
  bool _isLoading = false;

  Future<void> _getDetails() async {
    setState(() {
      _isLoading = true;
    });
    var json = await Request.getJson(url + widget.id);
    var data = JsonDecoder().convert(json);
    setState(() {
      _isLoading = false;
      pokemonDetails = PokemonDetails.fromJson(data);
    });
  }

  @override
  void initState() {
    super.initState();
    _getDetails();
  }

  double _getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  void _backToList(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: _getHeight(context) * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                  child: _isLoading
                      ? Center(
                          child: Loader(),
                        )
                      : Column(
                          children: <Widget>[
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(79, 79, 79, 1.0),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.types
                                  .map(
                                    (type) => TypeDisplay(
                                      name: type.name,
                                      color: type.color,
                                      imagePath: type.icon,
                                    ),
                                  )
                                  .toList(),
                            ),
                            Text(
                              pokemonDetails.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(79, 79, 79, 1.0),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'STATS',
                              style:
                                  TextStyle(fontSize: 18, color: widget.color),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: pokemonDetails.stats.reversed
                                    .map((stat) => Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 65,
                                              child: Text(
                                                stat.name.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: widget.color,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              stat.value
                                                  .toString()
                                                  .padLeft(3, '0'),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(
                                                    102, 102, 102, 1.0),
                                              ),
                                            ),
                                            Spacer(),
                                            StatBar(
                                              value: stat.value,
                                              color: widget.color,
                                            )
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ))
                          ],
                        ),
                ),
              ),
              Container(
                height: _getHeight(context) * 0.2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => _backToList(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Hero(
                          tag: widget.name.toLowerCase(),
                          child: widget.image,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
