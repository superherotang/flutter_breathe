import 'package:dio/dio.dart';

/// 自定义异常
class AppException implements Exception {
  final String _message;
  final int _code;

  AppException(
    this._code,
    this._message,
  );

  @override
  String toString() {
    return "$_code$_message";
  }

  String getMessage() {
    return _message;
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      // case DioErrorType.cancel:
      //   {
      //     return BadRequestException(-1, "请求取消");
      //   }
      case DioErrorType.connectTimeout:
        {
          return BadRequestException(-1, "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, "请求超时");
        }
      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, "响应超时");
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response!.statusCode;
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode!, "请求语法错误");
                }
              case 401:
                {
                  return UnauthorisedException(errCode!, "没有权限");
                }
              case 403:
                {
                  return UnauthorisedException(errCode!, "服务器拒绝执行");
                }
              case 404:
                {
                  return UnauthorisedException(errCode!, "无法连接服务器");
                }
              case 405:
                {
                  return UnauthorisedException(errCode!, "请求方法被禁止");
                }
              case 500:
                {
                  return UnauthorisedException(errCode!, "服务器内部错误");
                }
              case 502:
                {
                  return UnauthorisedException(errCode!, "无效的请求");
                }
              case 503:
                {
                  return UnauthorisedException(errCode!, "服务器挂了");
                }
              case 505:
                {
                  return UnauthorisedException(errCode!, "不支持HTTP协议请求");
                }
              default:
                {
                  return AppException(errCode!, error.response!.statusMessage!);
                }
            }
          } on Exception catch (_) {
            return AppException(-1, "未知错误");
          }
        }
      default:
        {
          return AppException(-1, error.error.message!);
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException(int code, String message) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException(int code, String message) : super(code, message);
}
