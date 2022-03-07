import 'package:flutter_breathe/common/lang/en_US.dart';
import 'package:flutter_breathe/common/lang/zh_CN.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}
