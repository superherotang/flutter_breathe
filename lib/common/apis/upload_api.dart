import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class UploadApi {
  static String userUrl = "http://10.6.50.108:8999";

  ///上传文件
  static Future<String> singleUpload({
    required File file,
  }) async {
    FormData formData =
        FormData.fromMap({"file": await MultipartFile.fromFile(file.path)});
    return await HttpUtils.post(userUrl + "/minio/upload/breathe-images",
        data: formData);
  }
}
