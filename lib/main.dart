import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hubang/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(createApp());
}
