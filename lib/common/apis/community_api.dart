import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class CommunityApi {
  static const String postsUrl = "http://10.6.50.108:8002";

  ///创建社区
  static Future<dynamic> createCommunity({
    required String uid,
    required String name,
    required String avatar,
    String? location,
    required String description,
  }) async {
    Map<String, dynamic> map = {
      "administrator": uid,
      "communityName": name,
      "avatar": avatar,
      "description": description,
      "founder": uid,
      "location": location,
      "status": 1
    };

    return await HttpUtils.post(postsUrl + "/community/createCommunity",
        params: map);
  }


  ///获取社区信息
  static Future<MyResponse> getCommunityInfo(String cid) async {
    return await HttpUtils.get(postsUrl + "/community/getCommunityInfo/" + cid);
  }

   ///获取社区信息
  static Future<MyResponse> getCommunityAnnouncement(String cid) async {
    return await HttpUtils.get(postsUrl + "/communityAnnouncement/getCommunityAnnouncement/" + cid);
  }
}
