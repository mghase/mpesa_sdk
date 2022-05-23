import 'api_method_type.dart';

/// API Context that contain info for the API endpoint
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

  /// Constructor with optional pre-populated variables
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

  /// Build the URL from context parameters
  String get getUrl {
    if (ssl == true) {
      return 'https://$address:$port$path';
    } else {
      return 'http://$address:$port$path';
    }
  }

  /// Add/update headers
  void addHeader(String header, dynamic value) {
    headers[header] = value;
  }

  /// Get headers as an array
  Map<String, dynamic> getHeaders() {
    return headers;
  }

  /// Add parameter
  void addParameter(String key, dynamic value) {
    parameters[key] = value;
  }

  /// Get parameters
  Map<String, dynamic> getParameters() {
    return parameters;
  }

  /// get api key
  String getApiKey() {
    return apiKey;
  }

  /// set api key
  void setApiKey(String apiKey) {
    if (apiKey.runtimeType != String) {
      throw Exception('api_key must be a string');
    } else {
      this.apiKey = apiKey;
    }
  }

  /// get public key
  String getPublicKey() {
    return publicKey;
  }

  /// set public key
  void setPublicKey(String publicKey) {
    if (publicKey.runtimeType != String) {
      throw Exception('public_key must be a string');
    } else {
      this.publicKey = publicKey;
    }
  }

  /// get ssl
  bool getSSL() {
    return ssl;
  }

  /// set ssl
  void setSSL(bool ssl) {
    if (ssl.runtimeType != bool) {
      throw Exception('ssl must be a boolean');
    } else {
      this.ssl = ssl;
    }
  }

  /// Get method type
  int getMethodType() {
    return methodType;
  }

  /// Set methode type [0][1][2] for GET POST AND PUT
  void setMethodType(int methodType) {
    if (methodType.runtimeType != int) {
      throw Exception('method_type must be a integer');
    } else {
      this.methodType = methodType;
    }
  }

  /// get address
  String getAddress() {
    return address;
  }

  ///set address
  void setAddress(String address) {
    if (address.runtimeType != String) {
      throw Exception('address must be a string');
    } else {
      this.address = address;
    }
  }

  /// Get port number
  int getPort() {
    return port;
  }

  ///  Set port number
  void setPort(int port) {
    if (port.runtimeType != int) {
      throw Exception('port must be a integer');
    } else {
      this.port = port;
    }
  }

  /// get path endpoint
  String getPath() {
    return path;
  }

  ///set path
  void setPath(String path) {
    if (path.runtimeType != String) {
      throw Exception('path must be a string');
    } else {
      this.path = path;
    }
  }
}
