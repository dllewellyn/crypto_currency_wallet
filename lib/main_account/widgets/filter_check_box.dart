import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterCheckBox extends StatelessWidget {
  final bool checkBoxValue;
  final Function onCheckChanged;

  const FilterCheckBox({
    Key key,
    this.checkBoxValue,
    this.onCheckChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Hide empty accounts",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Checkbox(
            value: checkBoxValue,
            onChanged: (changed) => onCheckChanged(),
          ),
        ],
      ),
    );
  }
}
