import 'package:dio/dio.dart';
import 'package:mpesa_sdk/src/api_context.dart';
import 'package:mpesa_sdk/src/api_method_type.dart';
import 'package:mpesa_sdk/src/api_request.dart';
import 'package:mpesa_sdk/src/api_response.dart';

enum ENV{
    sandbox,
    openapi
}

class Mpesa{
   final String apiKey;
   final String publicKey;
   final ENV env;
   late APIContext apiContext;
   late APIRequest req;
   APIResponse? response;

  Mpesa({ this.env = ENV.sandbox, required this.apiKey,required this.publicKey});

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
    print("uuuuuu================${env.name}");
    final sessionID = await getSession(sessionId:sessionId);

    apiContext = APIContext(headers: {}, parameters: {})
      ..setApiKey(sessionID!)
      ..setPublicKey(publicKey)
      ..setSSL(true)
      ..setMethodType(APIMethodType.POST)
      ..setAddress("openapi.m-pesa.com")
      ..setPort(443)
      ..setPath("/${env.name}/ipg/v2/vodacomTZN/c2bPayment/singleStage/");

    apiContext.addParameter("input_Amount", inputAmount);
    apiContext.addParameter("input_Country", "TZN");
    apiContext.addParameter("input_Currency", "TZS");
    apiContext.addParameter("input_CustomerMSISDN", inputCustomerMSISDN);
    apiContext.addParameter("input_ServiceProviderCode", inputServiceProviderCode);
    apiContext.addParameter("input_ThirdPartyConversationID",inputThirdPartyConversationID);
    apiContext.addParameter("input_TransactionReference", inputTransactionReference);
    apiContext.addParameter("input_PurchasedItemsDesc", inputPurchasedItemsDesc);

    print("-params-${apiContext.getUrl}");

    req = APIRequest(apiContext);
    apiContext.addHeader("Origin", "*");
    await Future.delayed(const Duration(seconds: 1));
    try {
      response = await req.execute();
      print("--${response?.body}");
      print("--${response?.statusCode}");
      print("--${response?.headers}");
      return response;
    } on DioError catch (e) {
      print("Call 2 failed: ${e.response}");
      rethrow;
    }
    return null;


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
       ..setPath("/${env.name}/ipg/v2/vodacomTZN/getSession/");
     apiContext.addHeader("Origin", "*");

      req = APIRequest(apiContext);
     // apiContext.addHeader("Origin", "*");
     // Do the API call and put result in a response packet
   //  APIResponse? response;
     try {
       response = await req.execute();
        sessionId = response?.getBody()["output_SessionID"];
       print("SESSION_ID==${sessionId}");
       return sessionId;
     } on DioError catch (e) {
       print("Call failed: ${e.response}");
       rethrow;
     }
   }
 }

