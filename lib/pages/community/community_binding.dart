import 'package:get/get.dart';

import 'community_controller.dart';

class CommunityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityController>(() => CommunityController());
  }
}
