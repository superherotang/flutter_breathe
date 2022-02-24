import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hubang/app.dart';

import 'common/dependency_injection.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await DenpendencyInjection.init();
  runApp(createApp());
}
