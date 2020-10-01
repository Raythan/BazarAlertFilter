import 'package:flutter/material.dart';

PreferredSize retornaAppBar(_appBarTitle) {
  return PreferredSize(
    preferredSize: Size.fromHeight(100.0), // here the desired height
    child: AppBar(
      title: Text(_appBarTitle),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      //centerTitle: true,
    ),
  );
}
