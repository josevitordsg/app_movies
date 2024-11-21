import 'package:app_movies/data/style_appbar.dart';
import 'package:flutter/material.dart';

AppBar createAppBar(context, String title){
  return AppBar(
        title: Center(
          child: Transform.translate(
            offset: const Offset(-20, 0),
            child: Text(
              title, 
              style: colorTextAppBar
            ),
          ),
        ),
        leading: IconButton(
          icon:  iconAppBar,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
}