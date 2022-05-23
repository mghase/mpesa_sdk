import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_sdk/mpesa_sdk.dart';

void main() async{
  String publicKey = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArv9yxA69XQKBo24BaF/D+fvlqmGdYjqLQ5WtNBb5tquqGvAvG3WMFETVUSow/LizQalxj2ElMVrUmzu5mGGkxK08bWEXF7a1DEvtVJs6nppIlFJc2SnrU14AOrIrB28ogm58JjAl5BOQawOXD5dfSk7MaAA82pVHoIqEu0FxA8BOKU+RGTihRU+ptw1j4bsAJYiPbSX6i71gfPvwHPYamM0bfI4CmlsUUR3KvCG24rB6FNPcRBhM3jDuv8ae2kC33w9hEq8qNB55uw51vK7hyXoAa+U7IqP1y6nBdlN25gkxEA8yrsl1678cspeXr+3ciRyqoRgj9RD/ONbJhhxFvt1cLBh+qwK2eqISfBb06eRnNeC71oBokDm3zyCnkOtMDGl7IvnMfZfEPFCfg5QgJVk1msPpRvQxmEsrX9MQRyFVzgy2CWNIb7c+jPapyrNwoUbANlN8adU1m6yOuoX7F49x+OjiG2se0EJ6nafeKUXw/+hiJZvELUYgzKUtMAZVTNZfT8jjb58j8GVtuS+6TM2AutbejaCV84ZK58E2CRJqhmjQibEUO6KPdD7oTlEkFy52Y1uOOBXgYpqMzufNPmfdqqqSM4dU70PO8ogyKGiLAIxCetMjjm6FCMEA3Kc8K0Ig7/XtFm9By6VxTJK1Mg36TlHaZKP6VzVLXMtesJECAwEAAQ==";
  String apiKey= "VursptPgyxo4hyfD8SBWVQmP9HWCzvfj";

  final mpesa = Mpesa(
        env: ENV.sandbox,
        market: MarketCountry.vodacomTZN,
        apiKey: apiKey,
        publicKey: publicKey
  );

  final res = await mpesa.c2b(
      inputAmount: 1000,
      inputCustomerMSISDN: "000000000001",
      inputServiceProviderCode: "000000",
      inputCountry: "TZN",
      inputCurrency: "TZS",
      inputThirdPartyConversationID: "asv02e5yy58774fttt228d83d0d689761",
      inputTransactionReference: "T12774C",
      inputPurchasedItemsDesc: "BAG");

  print("********RESS****<<<<<<<<<<<${res?.getBody()}");
 //
 //  // Cryptom crypto = Cryptom(publicKey);
 //  APIContext apiContext = APIContext(headers: {}, parameters: {})
 //    ..setPublicKey(publicKey)
 //    ..setApiKey(apiKey)
 //    ..setSSL(true)
 //    ..setMethodType(APIMethodType.GET)
 //    ..setAddress("openapi.m-pesa.com")
 //    ..setPort(443)
 //    ..setPath("/sandbox/ipg/v2/vodacomTZN/getSession/");
 //  apiContext.addHeader("Origin", "*");
 //
 //
 //  APIRequest req = APIRequest(apiContext);
 //  // apiContext.addHeader("Origin", "*");
 //  // Do the API call and put result in a response packet
 //  APIResponse? response;
 //  try {
 //    response = await req.execute();
 //    print("${response?.body}");
 //
 //    print("*******************************");
 //  } on DioError catch (e) {
 //    print("Call failed: ${e.response}");
 //  }
 //
 //  String sessionId = response?.getBody()["output_SessionID"];
 //  print("SESSION_ID==${sessionId}");
 //
 //  apiContext = APIContext(headers: {}, parameters: {})
 //    ..setApiKey(sessionId)
 //    ..setPublicKey(publicKey)
 //    ..setSSL(true)
 //    ..setMethodType(APIMethodType.POST)
 //    ..setAddress("openapi.m-pesa.com")
 //    ..setPort(443)
 //    ..setPath("/sandbox/ipg/v2/vodacomTZN/c2bPayment/singleStage/");
 //
 //  apiContext.addParameter("input_Amount", "1000");
 //  apiContext.addParameter("input_Country", "TZN");
 //  apiContext.addParameter("input_Currency", "TZS");
 //  apiContext.addParameter("input_CustomerMSISDN", "000000000001");
 //  apiContext.addParameter("input_ServiceProviderCode", "000000");
 //  apiContext.addParameter("input_ThirdPartyConversationID", "asv02eYT6761");
 // apiContext.addParameter("input_TransactionReference", "T331");
 //  apiContext.addParameter("input_PurchasedItemsDesc", "Shoes GH");
 //
 //  print("-params-${apiContext.getUrl}");
 //
 //  req = APIRequest(apiContext);
 //  apiContext.addHeader("Origin", "*");
 //  await Future.delayed(const Duration(seconds: 1));
 //  try {
 //    response = await req.execute();
 //    print("--${response?.body}");
 //    print("--${response?.statusCode}");
 //    print("--${response?.headers}");
 //  } on DioError catch (e) {
 //    print("Call 2 failed: ${e.response}");
 //  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body:Text( 'Flutter Demo Home Page')),
    );
  }
}

