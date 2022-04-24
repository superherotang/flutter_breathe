import 'package:flutter_breathe/common/apis/base_url.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class PostsApi {
  static const String postsUrl = "/breathePosts";

  ///根据uid获取用户帖子
  static Future<dynamic> getPostsInfoByUid(
      List<String> uid, int current) async {
    Map<String, dynamic> map = {'uid': uid, 'current': current};

    return await HttpUtils.post(baseUrl + postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///获取所有帖子
  static Future<dynamic> getAllPostsInfo(
    int current,
  ) async {
    Map<String, dynamic> map = {'current': current};

    return await HttpUtils.post(baseUrl + postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///根据社区获取所有帖子
  static Future<dynamic> getPostsInfoByCom(
    List<String> cid,
    int current,
  ) async {
    Map<String, dynamic> map = {'cid': cid, 'current': current};

    return await HttpUtils.post(baseUrl + postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///根据类型获取所有帖子
  static Future<dynamic> getPostsTextByType(
    String type,
    int current,
  ) async {
    Map<String, dynamic> map = {'type': type, 'current': current};

    return await HttpUtils.post(baseUrl + postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///根据社区获取所有帖子
  static Future<dynamic> getPostsInfoByComAndType(
    List<String> cid,
    String type,
    int current,
  ) async {
    Map<String, dynamic> map = {'cid': cid, 'type': type, 'current': current};

    return await HttpUtils.post(baseUrl + postsUrl + "/posts/getPostInfoPage",
        params: map);
  }

  ///根据帖子获取评论
  static Future<dynamic> getCommentByPid(
    String pid,
    int current,
  ) async {
    return await HttpUtils.get(
        baseUrl + postsUrl + "/comment/getComment/$pid/" + current.toString());
  }

  ///评论
  static Future<dynamic> insertComment(
    String content,
    int uid,
    String postsId,
  ) async {
    Map<String, dynamic> map = {
      'content': content,
      'uid': uid,
      'postsId': postsId
    };
    return await HttpUtils.post(baseUrl + postsUrl + "/comment/insertComment",
        params: map);
  }

  ///发布帖子
  static Future<dynamic> releasePosts(Map<String, dynamic> map) async {
    return await HttpUtils.post(baseUrl + postsUrl + "/posts/release",
        params: map);
  }
}
