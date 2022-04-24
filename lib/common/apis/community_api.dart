import 'package:flutter_breathe/common/apis/base_url.dart';
import 'package:flutter_breathe/model/request/my_response.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class CommunityApi {
  static const String communityUrl = "/breatheCommunity";

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

    return await HttpUtils.post(
        baseUrl + communityUrl + "/community/createCommunity",
        params: map);
  }

  ///获取社区信息
  static Future<MyResponse> getCommunityInfo(String cid) async {
    return await HttpUtils.get(
        baseUrl + communityUrl + "/community/getCommunityInfo/" + cid);
  }

  ///获取社区公告信息
  static Future<MyResponse> getCommunityAnnouncement(String cid) async {
    return await HttpUtils.get(baseUrl +
        communityUrl +
        "/communityAnnouncement/getCommunityAnnouncement/" +
        cid);
  }

  static Future<MyResponse> getMyCommunity(String uid) async {
    return await HttpUtils.get(baseUrl +
        communityUrl +
        "/communityPersonnel/getCommunityByUid/" +
        uid);
  }

  static Future<MyResponse> getCommunityList(int current) async {
    return await HttpUtils.get(
        baseUrl + communityUrl + "/community/getCommunityList/" + current.toString());
  }
}
