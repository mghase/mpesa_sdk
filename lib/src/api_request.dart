import 'package:mpesa_sdk/src/api_method_type.dart';
import 'package:mpesa_sdk/src/api_response.dart';
import 'package:mpesa_sdk/src/crypt_sra.dart';
import 'package:dio/dio.dart';

class APIRequest {
  var context;
  APIRequest(this.context);

  Future<APIResponse?> execute() async {
    if (context == null) {
      throw Exception('Context cannot be null');
    }
    createDefaultHeaders();
    switch (context.getMethodType()) {
      case APIMethodType.GET:
        return await __get();
      case APIMethodType.POST:
        return await __post();
      case APIMethodType.PUT:
        return __put();
      default:
        return null;
    }
  }

  String createBearerToken() {
    final encryptedMSG =CryptSRA.encrypt(apiKey:context.apiKey, publicKey:context.publicKey);
    return encryptedMSG;
  }

  void createDefaultHeaders() {
    context.addHeader('Authorization', 'Bearer ${createBearerToken()}');
    context.addHeader('Content-Type', 'application/json');
    context.addHeader('Accept', 'application/json');
     context.addHeader('Content-Length', context.getParameters().length);
    context.addHeader('Host', context.getAddress());
  }

  Future<APIResponse> __get() async {
    final dio = Dio();

    final r = await dio.get(
      context.getUrl,
      queryParameters: context.getParameters(),
      options: Options(
        headers: context.getHeaders(),
      ),
    );

    return APIResponse(statusCode: r.statusCode, body: r.data, headers: r.headers.map);
  }

  Future<APIResponse> __post() async {
    final dio = Dio();
    final r = await dio.post(
      context.getUrl,
      data: context.getParameters(),
      options: Options(
        headers: context.getHeaders(),
      ),
    );

    return APIResponse(statusCode: r.statusCode, body: r.data, headers: r.headers.map);
  }

  Future<APIResponse> __put() async {
    final dio = Dio();

    final r = await dio.put(
      context.getUrl,
      data: context.getParameters(),
      options: Options(
        headers: context.getHeaders(),
      ),
    );

    return APIResponse(statusCode: r.statusCode, body: r.data, headers: r.headers.map);
  }
}
