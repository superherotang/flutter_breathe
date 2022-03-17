import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

import 'common/dependency_injection.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp, // 竖屏 Portrait 模式
      DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft, // 横屏 Landscape 模式
      // DeviceOrientation.landscapeRight,
    ],
  );

  await DenpendencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(createApp());
}
