# mpesa-sdk

Dart package for VODACOM M-Pesa API(Open API) (TANZANIA,GHANA AND LESOTHO )
MARKET = vodacomTZN, vodafoneGHA, vodacomLES
COUNTRY = TZN, GHA, LES
CURRENCY = TZS, GHS, LSL


## Features
Ready Methods/APIs

- [√] C2B
- [√] B2C
- [√] B2B
- [√] REVERSAL
- [x] TRANSACTION STATUS



## Getting started

### Credentials

1. Create an account on the [Vodacom Developer Portal](https://openapiportal.m-pesa.com/)
2. Register Your application
3. Get your keys -> `apiKey` and `publicKey`

## Usage
Add dependency on pubspec.yaml
```yaml
dependencies:
  mpesa_sdk: <latest_version>
```
Import in your Flutter app or plain dart app.

```dart
import 'package:mpesa_sdk/mpesa_sdk.dart';
```
Create an instance of Mpesa, then use its methods to consume the Api

```dart
import 'package:mpesa_sdk/mpesa_sdk.dart';
void main() async{
  String publicKey = "";
  String apiKey= "";

  final mpesa = Mpesa(
      env: ENV.sandbox,
      market: MarketCountry.vodacomTZN,
      apiKey: apiKey,
      publicKey: publicKey
  );

  final res = await mpesa.c2b(
      inputAmount: 1000,
      inputCustomerMSISDN: "000000000001", // CUSTOMER PHONE NUMBER
      inputServiceProviderCode: "000000", // PROVIDED CODE BY VODACOM AFTER REGISTERING YOUR ORG.
      inputCountry: "TZN",
      inputCurrency: "TZS",
      inputThirdPartyConversationID: "asv02e5yy58774fttt228d83d0d689761", // UNIQUE
      inputTransactionReference: "T12774C", // UNIQUE
      inputPurchasedItemsDesc: "BAG");

  print("********C2B**********<<<<<<<<<<<${res?.getBody()}>>>>>>>>>>>**********************C2B********");


  final res2 = await mpesa.b2c(
      inputAmount: 1000,
      inputCustomerMSISDN: "000000000001",
      inputServiceProviderCode: "000000",
      inputCountry: "TZN",
      inputCurrency: "TZS",
      inputThirdPartyConversationID: "as2v02e5yy58774fttt228d83d0d6897613444",
      inputTransactionReference: "T127744",
      inputPaymentItemsDesc: "SALARY PAYMENT");

  print("********B2C**********<<<<<<<<<<<${res2?.getBody()}>>>>>>>>>>>**********************B2C********");


  final res3 = await mpesa.b2b(
      inputAmount: 1000,
      inputReceiverPartyCode: "000001",
      inputPrimaryPartyCode: "000000",
      inputCountry: "TZN",
      inputCurrency: "TZS",
      inputThirdPartyConversationID: "as3v02e5yy58774fttt228d83d0d68976155",
      inputTransactionReference: "T1267755",
      inputPaymentItemsDesc: "SALARY PAYMENT");

  print("********B2B**********<<<<<<<<<<<${res3?.getBody()}>>>>>>>>>>>**********************B2B********");

  final res4 = await mpesa.reversal(
      inputReversalAmount: 25,
      inputServiceProviderCode: "000000",
      inputThirdPartyConversationID: "asv02e5958774f7ba228d83d0d689777",
      inputTransactionID: "0000000000001",
      inputCountry: "TZN"
  );

  print("********REVERSAL**********<<<<<<<<<<<${res4?.getBody()}>>>>>>>>>>>**********************REVERSAL********");

  final res5 = await mpesa.getTransactionStatus(
      inputQueryReference: "000000000000000000001",
      inputServiceProviderCode: "000000",
      inputThirdPartyConversationID: "asv02e5958774f7ba228d83d0d689761",
      inputCountry: "TZN"
  );


  print(
      "********Transaction Status**********<<<<<<<<<<<${res5?.getBody()}>>>>>>>>>>>**********************Transaction Status********");


}
```

## Copyright and license

MIT License

Copyright (c) 2022 Sadick F Mghase

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.