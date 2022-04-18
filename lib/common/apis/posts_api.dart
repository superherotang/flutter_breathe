import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class PostsApi {
  static const String postsUrl = "http://10.6.50.108:8003";

  ///根据uid获取用户帖子
  static Future<dynamic> getPostsInfoByUid(int current, String uid) async {
    Map<String, dynamic> map = {'uid': uid, 'current': current};

    return await HttpUtils.post(postsUrl + "/posts/getPostInfoPage",
        params: map);
  }
}
