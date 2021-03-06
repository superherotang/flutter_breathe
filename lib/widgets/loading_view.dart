import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/widgets/status.dart';
import 'package:get/get.dart';

class LoadingView extends GetView {
  ///异步事件
  final Future<dynamic>? future;

  // ///错误组件
  // final Widget errorWidget;

  // ///等待组件
  // final Widget waitWidget;

  ///完成组件
  final Widget doneWidget;
  const LoadingView(
      {Key? key,
      this.future,
      // required this.errorWidget,
      // required this.waitWidget,
      required this.doneWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return errorStatus();
            case ConnectionState.waiting:
              return loadingStatus();
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return doneWidget;
            default:
              return errorStatus();
          }
        });
  }
}
