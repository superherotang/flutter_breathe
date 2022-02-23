import 'package:get/get.dart';

import 'message_search_controller.dart';

class MessageSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageSearchController>(() => MessageSearchController());
  }
}
