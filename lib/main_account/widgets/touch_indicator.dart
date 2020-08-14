import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TouchIndicator extends StatelessWidget {
  const TouchIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.grey,
      ),
      height: 6,
      width: 40,
    );
  }
}
