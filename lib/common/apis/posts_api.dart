import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class PostsApi {
  ///获取所有帖子
  static Future<MyResponse> getAllPost({
    required int current,
  }) async {
    return await HttpUtils.get(
      "/posts/getAllPost/$current",
    );
  }
}
