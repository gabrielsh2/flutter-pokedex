import 'package:flutter/material.dart';

const int _maxValue = 200;

class StatBar extends StatelessWidget {
  const StatBar({
    Key key,
    @required this.value,
    @required this.color,
  })  : assert(value != null),
        assert(color != null),
        super(key: key);

  final int value;
  final Color color;

  double _getStatBarWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.6;
  }

  double _getValueBarWidth(BuildContext context) {
    return value * _getStatBarWidth(context) / _maxValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: _getStatBarWidth(context),
        height: 10,
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1.0),
            borderRadius: BorderRadius.circular(50.0)),
      ),
      Container(
        width: _getValueBarWidth(context),
        height: 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    ]);
  }
}
