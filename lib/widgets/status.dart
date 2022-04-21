import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget errorStatus() {
  return Padding(
    padding: EdgeInsets.only(top: 60.w),
    child: Column(
      children: [
        Image.asset(
          "assets/images/error.png",
          width: 1.sw/2,
          height: 1.sw/2,
          fit: BoxFit.fitWidth,
        ),
        Text(
          "错误",
          style: TextStyle(fontSize: 36.w),
        )
      ],
    ),
  );
}

Widget loadingStatus() {
  return Padding(
    padding: EdgeInsets.only(top: 60.w),
    child: Column(
      children: [
        Image.asset(
          "assets/images/Loading _Outline.png",
          width: 1.sw/2,
          height: 1.sw/2,
          fit: BoxFit.fitWidth,
        ),
        Text(
          "正在加载",
          style: TextStyle(fontSize: 36.w),
        )
      ],
    ),
  );
}

Widget nullStatus() {
  return Padding(
    padding: EdgeInsets.only(top: 60.w),
    child: Column(
      children: [
        Image.asset(
          "assets/images/null_content.png",
          width: 1.sw/2,
          height: 1.sw/2,
          fit: BoxFit.fitWidth,
        ),
        Text(
          "空空如也",
          style: TextStyle(fontSize: 36.w),
        )
      ],
    ),
  );
}

Widget noLoginStatus() {
  return Padding(
    padding: EdgeInsets.only(top: 60.w),
    child: Column(
      children: [
        Image.asset(
          "assets/images/noLogin.png",
          width: 1.sw/2,
          height: 1.sw/2,
          fit: BoxFit.fitWidth,
        ),
        Text(
          "没有登录",
          style: TextStyle(fontSize: 36.w),
        )
      ],
    ),
  );
}
