import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_breathe/common/apis/base_url.dart';
import 'package:flutter_breathe/request/http_utils.dart';

class UploadApi {
  static String minioUrl = "/breatheMinio";

  ///上传单文件
  static Future<String> singleUpload({
    required File file,
  }) async {
    FormData formData =
        FormData.fromMap({"file": await MultipartFile.fromFile(file.path)});
    return await HttpUtils.post(
        baseUrl + minioUrl + "/minio/upload/breathe-images",
        data: formData);
  }

  ///上传多文件
  static Future<String> multiUpload({
    required List<File> files,
    required String bucketName,
  }) async {
    FormData formData = FormData();
    for (int i = 0; i < files.length; i++) {
      formData.files.add(MapEntry(
          "files", await MultipartFile.fromFile(files[i].path.toString())));
    }

    print(formData);
    return await HttpUtils.post(
        baseUrl + minioUrl + "/minio/upload/"+bucketName,
        data: formData);
  }
}
