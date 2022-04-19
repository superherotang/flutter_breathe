import 'package:flutter_breathe/request/http_utils.dart';

class PostsApi {
  static const String postsUrl = "http://10.6.50.108:8003";

  ///根据uid获取用户帖子
  static Future<dynamic> getPostsInfoByUid(
      List<String> uid, int current) async {
    Map<String, dynamic> map = {'uid': uid, 'current': current};

    return await HttpUtils.post(postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///获取所有帖子
  static Future<dynamic> getAllPostsInfo(
    int current,
  ) async {
    Map<String, dynamic> map = {'current': current};

    return await HttpUtils.post(postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///根据社区社区获取所有帖子
  static Future<dynamic> getPostsInfoByCom(
    List<String> cid,
    int current,
  ) async {
    Map<String, dynamic> map = {'cid': cid, 'current': current};

    return await HttpUtils.post(postsUrl + "/posts/getPostInfoPage",
        params: map);
  }


    ///根据类型获取所有帖子
  static Future<dynamic> getPostsTextAndImage(
    String cid,
    int current,
  ) async {
    Map<String, dynamic> map = {'type': cid, 'current': current};

    return await HttpUtils.post(postsUrl + "/posts/getPostInfoPage",
        params: map);
  }
}
