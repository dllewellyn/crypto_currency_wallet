import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class ClearAppBar extends Container implements PreferredSize {
  final AppBar appBar = AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black));

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height + 1, child: SafeArea(child: appBar));
  }
}
