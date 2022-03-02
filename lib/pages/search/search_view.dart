import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Container();
  }
}
