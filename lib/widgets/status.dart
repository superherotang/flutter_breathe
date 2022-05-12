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

      ],
    ),
  );
}
