import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/export.dart';

class CryptSRA {

 static String encrypt({required String apiKey,required String publicKey}) {
    /// After a lot of research on how to convert the public key [String] to [RSA PUBLIC KEY]
    /// We would have to use PEM Cert Type and the convert it from a PEM to an RSA PUBLIC KEY through basic_utils
    var pem = '-----BEGIN RSA PUBLIC KEY-----\n$publicKey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);

    /// Initalizing Cipher
    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));

    /// Converting into a [Unit8List] from List<int>
    /// Then Encoding into Base64
    Uint8List output = cipher.process(Uint8List.fromList(utf8.encode(apiKey)));
    var base64EncodedText = base64Encode(output);
    return base64EncodedText;
  }

}
