import 'package:dio/dio.dart';
import 'package:mpesa_sdk/mpesa_sdk.dart';

/// environment mode for testing [ENV.sandbox] and for production [ENV.openapi]
enum ENV { sandbox, openapi }

/// Currently supported country. Tanzania [MarketCountry.vodacomTZN], GHANA [MarketCountry.vodafoneGHA]
/// and LESOTHO [MarketCountry.vodacomLES]
enum MarketCountry { vodacomTZN, vodafoneGHA, vodacomLES }

class Mpesa {
  final String apiKey;
  final String publicKey;
  final ENV env;
  final MarketCountry market;
  late APIContext apiContext;
  late APIRequest req;
  APIResponse? response;

  /// Constructor with optional parameters
  Mpesa(
      {this.env = ENV.sandbox,
      this.market = MarketCountry.vodacomTZN,
      required this.apiKey,
      required this.publicKey});

  /// Customer to business
  Future<APIResponse?> c2b(
      {required double inputAmount,
      required String inputCustomerMSISDN,
      String inputCountry = "TZN",
      String inputCurrency = "TZS",
      required String inputServiceProviderCode,
      required String inputThirdPartyConversationID,
      required String inputTransactionReference,
      required String inputPurchasedItemsDesc,
      String? sessionId}) async {
    final sessionID = await getSession(sessionId: sessionId);
    apiContext = APIContext(headers: {}, parameters: {})
      ..setApiKey(sessionID!)
      ..setPublicKey(publicKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.POST)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/${market.name}/c2bPayment/singleStage/");

    apiContext.addParameter("input_Amount", inputAmount);
    apiContext.addParameter("input_Country", inputCountry);
    apiContext.addParameter("input_Currency", inputCurrency);
    apiContext.addParameter("input_CustomerMSISDN", inputCustomerMSISDN);
    apiContext.addParameter(
        "input_ServiceProviderCode", inputServiceProviderCode);
    apiContext.addParameter(
        "input_ThirdPartyConversationID", inputThirdPartyConversationID);
    apiContext.addParameter(
        "input_TransactionReference", inputTransactionReference);
    apiContext.addParameter(
        "input_PurchasedItemsDesc", inputPurchasedItemsDesc);
    req = APIRequest(apiContext);
    apiContext.addHeader("Origin", "*");
    await Future.delayed(const Duration(seconds: 1));
    try {
      response = await req.execute();
      return response;
    } on DioError catch (e) {
      throw Exception(e.response?.data);
    }
  }

  /// Business to customer
  Future<APIResponse?> b2c(
      {required double inputAmount,
      required String inputCustomerMSISDN,
      String inputCountry = "TZN",
      String inputCurrency = "TZS",
      required String inputServiceProviderCode,
      required String inputThirdPartyConversationID,
      required String inputTransactionReference,
      required String inputPaymentItemsDesc,
      String? sessionId}) async {
    final sessionID = await getSession(sessionId: sessionId);
    apiContext = APIContext(headers: {}, parameters: {})
      ..setApiKey(sessionID!)
      ..setPublicKey(publicKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.POST)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/${market.name}/b2cPayment/");

    apiContext.addParameter("input_Amount", inputAmount);
    apiContext.addParameter("input_Country", inputCountry);
    apiContext.addParameter("input_Currency", inputCurrency);
    apiContext.addParameter("input_CustomerMSISDN", inputCustomerMSISDN);
    apiContext.addParameter(
        "input_ServiceProviderCode", inputServiceProviderCode);
    apiContext.addParameter(
        "input_ThirdPartyConversationID", inputThirdPartyConversationID);
    apiContext.addParameter(
        "input_TransactionReference", inputTransactionReference);
    apiContext.addParameter("input_PaymentItemsDesc", inputPaymentItemsDesc);
    apiContext.addHeader("Origin", "*");
    req = APIRequest(apiContext);

    /// SessionID can take up to 30 seconds to become 'live' in the system and will be invalid until it is
    await Future.delayed(const Duration(seconds: 1)); //30
    try {
      response = await req.execute();
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  /// Business to business
  Future<APIResponse?> b2b(
      {required double inputAmount,
      required String inputReceiverPartyCode,
      required String inputPrimaryPartyCode,
      required String inputThirdPartyConversationID,
      required String inputTransactionReference,
      required String inputPaymentItemsDesc,
      String inputCountry = "TZN",
      String inputCurrency = "TZS",
      String? sessionId}) async {
    final sessionID = await getSession(sessionId: sessionId);
    apiContext = APIContext(headers: {}, parameters: {})
      ..setApiKey(sessionID!)
      ..setPublicKey(publicKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.POST)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/${market.name}/b2bPayment/");

    apiContext.addParameter("input_Amount", inputAmount);
    apiContext.addParameter("input_Country", inputCountry);
    apiContext.addParameter("input_Currency", inputCurrency);
    apiContext.addParameter("input_ReceiverPartyCode", inputReceiverPartyCode);
    apiContext.addParameter("input_PrimaryPartyCode", inputPrimaryPartyCode);
    apiContext.addParameter(
        "input_ThirdPartyConversationID", inputThirdPartyConversationID);
    apiContext.addParameter(
        "input_TransactionReference", inputTransactionReference);
    apiContext.addParameter("input_PurchasedItemsDesc", inputPaymentItemsDesc);
    apiContext.addHeader("Origin", "*");
    req = APIRequest(apiContext);

    /// SessionID can take up to 30 seconds to become 'live' in the system and will be invalid until it is
    await Future.delayed(const Duration(seconds: 1)); //30
    try {
      response = await req.execute();
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  /// Transaction reversal
  Future<APIResponse?> reversal(
      {required double inputReversalAmount,
      required String inputServiceProviderCode,
      required String inputThirdPartyConversationID,
      required String inputTransactionID,
      String inputCountry = "TZN",
      String? sessionId}) async {
    final sessionID = await getSession(sessionId: sessionId);
    apiContext = APIContext(headers: {}, parameters: {})
      ..setApiKey(sessionID!)
      ..setPublicKey(publicKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.PUT)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/${market.name}/reversal/");

    apiContext.addParameter("input_ReversalAmount", inputReversalAmount);
    apiContext.addParameter("input_Country", inputCountry);
    apiContext.addParameter(
        "input_ServiceProviderCode", inputServiceProviderCode);
    apiContext.addParameter(
        "input_ThirdPartyConversationID", inputThirdPartyConversationID);
    apiContext.addParameter("input_TransactionID", inputTransactionID);

    apiContext.addHeader("Origin", "*");
    req = APIRequest(apiContext);

    /// SessionID can take up to 30 seconds to become 'live' in the system and will be invalid until it is
    await Future.delayed(const Duration(seconds: 1)); //30
    try {
      response = await req.execute();
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  /// Get transaction status
  Future<APIResponse?> getTransactionStatus(
      {required String inputQueryReference,
      required String inputServiceProviderCode,
      required String inputThirdPartyConversationID,
      String inputCountry = "TZN",
      String? sessionId}) async {
    final sessionID = await getSession(sessionId: sessionId);
    apiContext = APIContext(headers: {}, parameters: {})
      ..setApiKey(sessionID!)
      ..setPublicKey(publicKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.GET)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/${market.name}/queryTransactionStatus/");

    apiContext.addParameter("input_QueryReference", inputQueryReference);
    apiContext.addParameter(
        "input_ServiceProviderCode", inputServiceProviderCode);
    apiContext.addParameter(
        "input_ThirdPartyConversationID", inputThirdPartyConversationID);
    apiContext.addParameter("input_Country", inputCountry);

    apiContext.addHeader("Origin", "*");
    req = APIRequest(apiContext);

    /// SessionID can take up to 30 seconds to become 'live' in the system and will be invalid until it is
    await Future.delayed(const Duration(seconds: 1)); //30
    try {
      response = await req.execute();
      return response;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  /// Get session
  Future<String?> getSession({String? sessionId}) async {
    if (sessionId != null) return sessionId;

    apiContext = APIContext(headers: {}, parameters: {})
      ..setPublicKey(publicKey)
      ..setApiKey(apiKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.GET)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/${market.name}/getSession/");
    apiContext.addHeader("Origin", "*");

    req = APIRequest(apiContext);
    // apiContext.addHeader("Origin", "*");
    // Do the API call and put result in a response packet
    //  APIResponse? response;
    try {
      response = await req.execute();
      sessionId = response?.getBody()["output_SessionID"];
      return sessionId;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
