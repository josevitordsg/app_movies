import 'package:app_movies/data/style_appbar.dart';
import 'package:flutter/material.dart';

AppBar CreateAppBar(context, String title){
  return AppBar(
        title: Center(
          child: Transform.translate(
            offset: Offset(-20, 0),
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