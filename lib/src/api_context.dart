import 'api_method_type.dart';

class APIContext {
  String apiKey;
  String publicKey;
  bool ssl;
  int methodType;
  String address;
  int port;
  String path;
  Map<String, dynamic> headers;
  Map<String, dynamic> parameters;

  APIContext({
    this.apiKey = '',
    this.publicKey = '',
    this.ssl = false,
    this.methodType = APIMethodType.GET,
    this.address = '',
    this.port = 80,
    this.path = '',
    required this.headers,
    required this.parameters,
  }); // = [];

  // Build the URL from context parameters
  String get getUrl {
    if (ssl == true) {
      return 'https://$address:$port$path';
    } else {
      return 'http://$address:$port$path';
    }
  }

  // Add/update headers
  void addHeader($header, $value) {
    headers[$header] = $value;
  }

  // Get headers as an array
  Map<String, dynamic> getHeaders() {
    return headers;
  }

  // Add parameter
  void addParameter($key, $value) {
    parameters[$key] = $value;
  }

  // Get parameters
  Map<String, dynamic> getParameters() {
    return parameters;
  }

  String getApiKey() {
    return apiKey;
  }

  void setApiKey(String apiKey) {
    if (apiKey.runtimeType != String) {
      throw Exception('api_key must be a string');
    } else {
      this.apiKey = apiKey;
    }
  }

  String getPublicKey() {
    return publicKey;
  }

  void setPublicKey(String publicKey) {
    // print("pubkey>>>>>$publicKey}-run tyme ${publicKey.runtimeType != String}");
    if (publicKey.runtimeType != String) {
      throw Exception('public_key must be a string');
    } else {
      this.publicKey = publicKey;
    }
  }

  bool getSSL() {
    return ssl;
  }

  void setSSL(bool ssl) {
    if (ssl.runtimeType != bool) {
      throw Exception('ssl must be a boolean');
    } else {
      this.ssl = ssl;
    }
  }

  int getMethodType() {
    return methodType;
  }

  void setMethodType(int methodType) {
    if (methodType.runtimeType != int) {
      throw Exception('method_type must be a integer');
    } else {
      this.methodType = methodType;
    }
  }

  String getAddress() {
    return address;
  }

  void setAddress(String address) {
    if (address.runtimeType != String) {
      throw Exception('address must be a string');
    } else {
      this.address = address;
    }
  }

  int getPort() {
    return port;
  }

  void setPort(int port) {
    if (port.runtimeType != int) {
      throw Exception('port must be a integer');
    } else {
      this.port = port;
    }
  }

  String getPath() {
    return path;
  }

  void setPath(String path) {
    if (path.runtimeType != String) {
      throw Exception('path must be a string');
    } else {
      this.path = path;
    }
  }
}
