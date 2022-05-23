/// API Response
class APIResponse {
  int? statusCode;
  Map<String, dynamic> headers;
  Map<String, dynamic> body;

  /// Constructor
  APIResponse({this.statusCode, required this.headers, required this.body});

  ///Get header status code
  int? getStatusCode() {
    return statusCode;
  }

  /// set status code
  void setStatusCode(int statusCode) {
    if (statusCode.runtimeType != int) {
      throw Exception('status_code must be a integer');
    } else {
      this.statusCode = statusCode;
    }
  }

  /// Get herders
  Map<String, dynamic> getHeaders() {
    return headers;
  }

  /// Add headers
  void setHeaders(Map<String, dynamic> headers) {
    if (headers.runtimeType != Map) {
      throw Exception('headers must be a map');
    } else {
      this.headers = headers;
    }
  }

  /// Get response body
  Map<String, dynamic> getBody() {
    return body;
  }

  /// Set response body
  void setBody(Map<String, dynamic> body) {
    if (body.runtimeType != Map) {
      throw Exception('body must be a map');
    } else {
      this.body = body;
    }
  }
}
