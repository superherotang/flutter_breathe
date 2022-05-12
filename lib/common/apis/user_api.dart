import 'package:dio/dio.dart';
import 'package:flutter_breathe/common/apis/base_url.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class UserApi {
  static String userUrl = "/breatheUser";

  ///发送短信
  static Future<MyResponse> sendSms({
    required String phone,
  }) async {
    return await HttpUtils.get(
      baseUrl + userUrl + "/user/sentSms?phone=$phone",
    );
  }

  ///短信登录
  static Future<MyResponse> smsLoginOrRegister({
    required String phone,
    required String code,
  }) async {
    return await HttpUtils.get(
      baseUrl + userUrl + "/user/codeLogin?phone=$phone&code=$code",
    );
  }

  ///登录
  static Future<MyResponse> pwdLogin({
    required String phone,
    required String pwd,
  }) async {
    return await HttpUtils.post(
      baseUrl + userUrl + "/user/codeLogin?phone=$phone&code=$pwd",
    );
  }

  ///根据token获取用户数据
  static Future<MyResponse> getUserDataByToken() async {
    return await HttpUtils.get(baseUrl + userUrl + "/userData/getUserData",
        options: Options(headers: {
          'Authorization': UserStore.to.token.value,
        }),
        cacheDisk: true);
  }

  ///根据uid获取用户统计
  static Future<MyResponse> getUserCountByUid({required int uid}) async {
    return await HttpUtils.get(
        baseUrl + userUrl + "/userData/getUserCount/$uid",
        cacheDisk: true);
  }

  ///点赞
  static Future<dynamic> userLike(String pid, int uid, int status) async {
    Map<String, dynamic> map = {'pid': pid, 'uid': uid, 'status': status};

    return await HttpUtils.post(baseUrl + userUrl + "/userLike/save",
        params: map);
  }

  ///判断用户是否点赞
  static Future<dynamic> isUserLike(String pid, int uid) async {
    Map<String, dynamic> map = {'pid': pid, 'uid': uid};

    return await HttpUtils.post(baseUrl + userUrl + "/userLike/isLike",
        params: map);
  }

  ///更新用户状态
  static Future<MyResponse> changeStates(
      {required int uid, required int states}) async {
    return await HttpUtils.get(
        baseUrl + userUrl + "/user/changeStates/${uid}/${states}");
  }

  ///更新用户资料
  static Future<dynamic> updateUserData(
      {required String uid,
      required String avatar,
      String? birthday,
      String? description,
      String? location,
      required String nickname,
      required int sex}) async {
    Map<String, dynamic> map = {
      'uid': uid,
      'avatar': avatar,
      'birthday': birthday,
      'description': description,
      'location': location,
      'nickname': nickname,
      'sex': sex
    };
    return await HttpUtils.post(baseUrl + userUrl + "/userData/updateUserData",
        params: map);
  }
}
