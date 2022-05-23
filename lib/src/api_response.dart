class APIResponse {
  int? statusCode;
  Map<String, dynamic> headers;
  Map<String, dynamic> body;

  APIResponse({this.statusCode, required this.headers, required this.body});

  int? getStatusCode() {
    return statusCode;
  }

  void setStatusCode(int statusCode) {
    if (statusCode.runtimeType != int) {
      throw Exception('status_code must be a integer');
    } else {
      this.statusCode = statusCode;
    }
  }

  Map<String, dynamic> getHeaders() {
    return headers;
  }

  void setHeaders(Map<String, dynamic> headers) {
    if (headers.runtimeType != Map) {
      throw Exception('headers must be a map');
    } else {
      this.headers = headers;
    }
  }

  Map<String, dynamic> getBody() {
    return body;
  }

  void setBody(Map<String, dynamic> body) {
    if (body.runtimeType != Map) {
      throw Exception('body must be a map');
    } else {
      this.body = body;
    }
  }
}
