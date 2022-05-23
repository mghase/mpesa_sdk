# mpesa-sdk

Dart package for M-Pesa API(Open API) (TANZANIA )

## Features
Ready Methods/APIs

- [√] C2B
- [x] B2B
- [x] B2C
- [x] TRANSACTION STATUS
- [x] REVERSAL


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
      apiKey: apiKey, publicKey: publicKey);

  final res = await mpesa.c2b(
      inputAmount: 1000,
      inputCustomerMSISDN: "000000000001", //customer phone number +25578xxxxxxxxx
      inputServiceProviderCode: "000000", //provided code after registering
      inputThirdPartyConversationID: "asv02e5yy58774fttt228d83d0d689761",//unique
      inputTransactionReference: "T12774C", //unique
      inputPurchasedItemsDesc: "BAG");

  print("************<<<<<<<<<<<${res?.getBody()}");
  
}
```

## Copyright and license

MIT License

Copyright (c) 2020-2021 Ergito Vilanculos

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