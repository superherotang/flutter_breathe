import 'package:dio/dio.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class UserApi {
  ///发送短信
  static Future<MyResponse> sendSms({
    required String phone,
  }) async {
    return await HttpUtils.get(
      "/user/sentSms?phone=$phone",
    );
  }

  ///登录
  static Future<MyResponse> smsLoginOrRegister({
    required String phone,
    required String code,
  }) async {
    return await HttpUtils.get(
      "/user/codeLogin?phone=$phone&code=$code",
    );
  }

  ///根据token获取数据
  static Future<MyResponse> getUserDataByToken() async {
    return await HttpUtils.get("/userData/getUserData",
        options: Options(headers: {
          'Authorization': UserStore.to.token.value,
        }));
  }

  ///根据uid获取用户统计
  static Future<MyResponse> getUserCountByUid({required int uid}) async {
    return await HttpUtils.get(
      "/userData/getUserCount/$uid",
    );
  }
}
