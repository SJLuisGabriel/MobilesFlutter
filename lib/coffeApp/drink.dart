import 'package:flutter/material.dart';

class Drink {
  String name;
  String nonName;
  String backgroundImage;
  String imageTop;
  String imageSmall;
  // String imageBlur;
  // String cupImage;
  String description;
  String dificulty;
  Color darkcolor;
  Color lightcolor;

  Drink(
      this.name,
      this.nonName,
      this.backgroundImage,
      this.imageTop,
      this.imageSmall,
      // this.imageBlur,
      // this.cupImage,
      this.description,
      this.dificulty,
      this.darkcolor,
      this.lightcolor);
}
