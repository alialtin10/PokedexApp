import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();


  static const String pokeballImageUrl = 'images/pngwing.com.png';
  static const String title = "Pokedex";
  static TextStyle gettitleTextStyle() {
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(48),
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    } else {
      return (size * 1.5).sp;
    }
  }

  static TextStyle getPokemonNameTextStyle() {
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(24),
    );
  }

  static TextStyle getTypeChipTextStyle() {
    return  TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(20),
    );
  }

  static getPokeInformationTextStyle() {
    return  TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(16),
    );
  }

    static getPokeInfoLabelTextStyle() {
    return  TextStyle(
      color: Colors.black,
      fontSize: _calculateFontSize(20),
      fontWeight: FontWeight.bold
    );
  }

}
