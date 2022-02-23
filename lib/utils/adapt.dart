import 'package:flutter/material.dart';
import 'dart:ui';

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double width = mediaQuery.size.width;
  static double height = mediaQuery.size.height;
  static double topbarH = mediaQuery.padding.top;
  static double botbarH = mediaQuery.padding.bottom;
  static double pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;
  static init(int number) {
    int uiwidth = number is int ? number : 750;
    _ratio = width / uiwidth;
  }

  static px(number) {
    if (!(_ratio is double || _ratio is int)) {
      Adapt.init(750);
    }
    return number * _ratio;
  }

  static onepx() {
    return 1 / pixelRatio;
  }

  //屏幕宽
  static screenW() {
    return width;
  }

  //屏幕高
  static screenH() {
    return height;
  }

  //状态栏
  static padTopH() {
    return topbarH;
  }

  //底部栏
  static padBotH() {
    return botbarH;
  }
}
