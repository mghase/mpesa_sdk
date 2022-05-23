import 'package:dio/dio.dart';
import 'package:mpesa_sdk/mpesa_sdk.dart';
import 'package:mpesa_sdk/src/api_context.dart';
import 'package:mpesa_sdk/src/api_method_type.dart';
import 'package:mpesa_sdk/src/api_request.dart';
import 'package:mpesa_sdk/src/api_response.dart';

enum ENV{
    sandbox,
    openapi
}

enum MarketCountry{
  vodacomTZN,
  vodafoneGHA,
  vodacomLES
}

class Mpesa{
   final String apiKey;
   final String publicKey;
   final ENV env;
   final MarketCountry market;
   late APIContext apiContext;
   late APIRequest req;
   APIResponse? response;

  Mpesa({
    this.env = ENV.sandbox,
    this.market = MarketCountry.vodacomTZN,
    required this.apiKey,
    required this.publicKey
  });

  Future<APIResponse?> c2b({
    required double inputAmount,
    required String inputCustomerMSISDN,
     String inputCountry = "TZN",
     String inputCurrency = "TZS",
     required String inputServiceProviderCode,
     required String inputThirdPartyConversationID,
     required String inputTransactionReference,
     required String inputPurchasedItemsDesc,

    String? sessionId}) async{
    final sessionID = await getSession(sessionId:sessionId);
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
    apiContext.addParameter("input_ServiceProviderCode", inputServiceProviderCode);
    apiContext.addParameter("input_ThirdPartyConversationID",inputThirdPartyConversationID);
    apiContext.addParameter("input_TransactionReference", inputTransactionReference);
    apiContext.addParameter("input_PurchasedItemsDesc", inputPurchasedItemsDesc);
    req = APIRequest(apiContext);
    apiContext.addHeader("Origin", "*");
    await Future.delayed(const Duration(seconds: 1));
    try {
      response = await req.execute();
      return response;
    } on DioError catch (e) {
      rethrow;
    }

  }
  static b2b(){
  }
  static b2c(){}
  static reversal(){}
  static getTransactionStatus(){}

 Future<String?>  getSession({String? sessionId}) async {
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
       rethrow ;
     }
   }
 }

