import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/export.dart';

class CryptSRA {

 static String encrypt({required String apiKey,required String publicKey}) {
   var pem = '-----BEGIN RSA PUBLIC KEY-----\n$publicKey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);

    /// Initalizing Cipher
    var cipher = PKCS1Encoding(RSAEngine())..init(true, PublicKeyParameter<RSAPublicKey>(public));

    /// Converting into a [Unit8List] from List<int>
    /// Then Encoding into Base64
    Uint8List output = cipher.process(Uint8List.fromList(utf8.encode(apiKey)));
    var base64EncodedText = base64Encode(output);
    return base64EncodedText;
  }

}
