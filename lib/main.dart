import 'package:flutter/material.dart';
import 'app.dart';
import 'common/global.dart';

void main() async {
  await Global.init();
  runApp(createApp());
}


