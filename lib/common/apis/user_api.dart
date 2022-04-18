import 'package:dio/dio.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class UserApi {
  static const String userUrl = "http://10.6.50.108:8001";
  static const String postsUrl = "http://10.6.50.108:8003";

  ///发送短信
  static Future<MyResponse> sendSms({
    required String phone,
  }) async {
    return await HttpUtils.get(
      userUrl + "/user/sentSms?phone=$phone",
    );
  }

  ///登录
  static Future<MyResponse> smsLoginOrRegister({
    required String phone,
    required String code,
  }) async {
    return await HttpUtils.get(
      userUrl + "/user/codeLogin?phone=$phone&code=$code",
    );
  }

  ///根据token获取用户数据
  static Future<MyResponse> getUserDataByToken() async {
    return await HttpUtils.get(userUrl + "/userData/getUserData",
        options: Options(headers: {
          'Authorization': UserStore.to.token.value,
        }),
        cacheDisk: true);
  }

  ///根据uid获取用户统计
  static Future<MyResponse> getUserCountByUid({required int uid}) async {
    return await HttpUtils.get(userUrl + "/userData/getUserCount/$uid",
        cacheDisk: true);
  }

  ///根据token获取用户帖子
  static Future<MyResponse> getPostsInfoByUid() async {
    return await HttpUtils.post(
      postsUrl + "/posts/getPostInfoPage",
    );
  }
}
