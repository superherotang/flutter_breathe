import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/apis/user_api.dart';
import 'package:flutter_breathe/common/middlewares/router_auth.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/utils/my_toast.dart';
import 'package:flutter_breathe/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeButton extends StatefulWidget {
  final IconData icon;
  final String? pid;
  final int count;
  final double? size;
  const LikeButton({
    Key? key,
    required this.icon,
    required this.count,
    this.size = 36,
    this.pid,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLike = false;
  int tempCount = 0;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        tempCount = widget.count;
      });
    }
    if (UserStore.to.isLogin) {
      if (widget.pid != null) {
        getLike();
      }
    }
  }

  getLike() async {
    try {
      dynamic response =
          await UserApi.isUserLike(widget.pid!, UserStore.to.userData!.uid);
      MyResponse myResponse = MyResponse.fromJson(response);
      if (myResponse.success) {
        bool flag = myResponse.data['flag'];
        if (flag) {
          if (mounted) {
            setState(() {
              isLike = true;
            });
          }
        }
      }
    } on DioError catch (e) {
      MyToast(e.message);
    } catch (e) {
      MyToast(e.toString());
    }
  }

  setLike() async {
    try {
      dynamic response = await UserApi.userLike(
          widget.pid!, UserStore.to.userData!.uid, isLike ? 0 : 1);
      MyResponse myResponse = MyResponse.fromJson(response);
      if (myResponse.success) {
        if (isLike) {
          if (mounted) {
            setState(() {
              isLike = false;
              tempCount--;
            });
          }
        }else{
          if (mounted) {
            setState(() {
              isLike = true;
              tempCount++;
            });
          }
        }
      } else {
        MyToast(myResponse.message);
      }
    } on DioError catch (e) {
      MyToast(e.message);
    } catch (e) {
      MyToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await RouteAuth().auth()) {
          setLike();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: widget.size!.w,
              color: isLike ? Colors.red : Colors.black,
            ),
            SizedBox(
              width: 2.w,
            ),
            widget.count == null
                ? Container()
                : Text(
                    Utils.intFormat(tempCount),
                    style: TextStyle(
                        fontSize: widget.size! / 2.2,
                        height: 1.2,
                        color: isLike ? Colors.red : Colors.black),
                  )
          ],
        ),
      ),
    );
  }
}



// class LikeButton extends GetView {
//   final IconData icon;
//   final String? count;
//   final double? size;
//   final Color? color;
//   const LikeButton({
//     Key? key,
//     required this.icon,
//     this.count,
//     this.size = 36,
//     this.color = Colors.black,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print("object");
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.w),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon,
//               size: size!.w,
//               color: color,
//             ),
//             SizedBox(
//               width: 2.w,
//             ),
//             count == null
//                 ? Container()
//                 : Text(
//                     count!,
//                     style: TextStyle(
//                         fontSize: size! / 2.2, height: 1.2, color: color),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }

