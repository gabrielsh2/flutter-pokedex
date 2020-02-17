import 'package:flutter/material.dart';

class TypeDisplay extends StatelessWidget {
  TypeDisplay({
    @required this.name,
    @required this.color,
    @required this.imagePath,
    Key key,
  })  : assert(color != null),
        assert(name != null),
        assert(imagePath != null),
        super(key: key);

  final Color color;
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Image.asset(imagePath),
              SizedBox(
                width: 10,
              ),
              Text(
                name.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
