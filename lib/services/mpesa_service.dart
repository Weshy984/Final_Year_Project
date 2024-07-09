import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tiqiti/services/const.dart';

class MpesaService {
 final String consumerKey = C_KEY;
 final String consumerSecret = C_SECRET;
 final String shortCode = S_CODE;
 final String passKey = PASSKEY;
 final String lipaNaMpesaOnlineUrl = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
 final String oauthTokenUrl = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';

 Future<String> _getAccessToken() async {
  String credentials = "TzhBQ25DYzJOUHBrWjN1UWxNWTVqaUFEVk05TUJpQ1RDeVIxamg4dVFJMk54R0NwOjRKWVE2U3BsYktreWtDNWszUVdab25lcEh4a0djSTJjeHpoVUdjM1RhSDFOUmpSR3hoRFJERHo4U0p2UDlaejk";
  var response = await http.get(
   Uri.parse(oauthTokenUrl),
   headers: {
    'Authorization': 'Basic $credentials',
   },
  );

  if (response.statusCode == 200) {
   var jsonResponse = json.decode(response.body);
   return jsonResponse['access_token'];
  } else {
   throw Exception('Failed to get access token');
  }
 }
 Future<void> lipaNaMpesaOnline(String phoneNumber, String amount) async {
  try {
   print('Consumer Key: $consumerKey');
   print('Consumer Secret: $consumerSecret');
   print('Short Code: $shortCode');

   String accessToken = await _getAccessToken();
   String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
   String password = base64Encode(utf8.encode('$shortCode$passKey$timestamp'));

   print('Access Token: $accessToken');
   print('Timestamp: $timestamp');
   print('Password: $password');

   var response = await http.post(
    Uri.parse(lipaNaMpesaOnlineUrl),
    headers: {
     'Authorization': 'Bearer $accessToken',
     'Content-Type': 'application/json',
    },
    body: json.encode({
     'BusinessShortCode': shortCode,
     'Password': password,
     'Timestamp': timestamp,
     'TransactionType': 'CustomerPayBillOnline',
     'Amount': amount,
     'PartyA': phoneNumber,
     'PartyB': shortCode,
     'PhoneNumber': phoneNumber,
     'CallBackURL': 'https://example.com/callback',
     'AccountReference': 'TestPayment',
     'TransactionDesc': 'Payment for goods',
    }),
   );

   if (response.statusCode == 200) {
    print('STK Push initiated successfully');
   } else {
    print('Failed to initiate STK Push: ${response.body}');
    throw Exception('Failed to initiate STK Push: ${response.body}');
   }
  } catch (e) {
   print('Error in lipaNaMpesaOnline: $e');
   throw e;
  }
 }


// Future<void> lipaNaMpesaOnline(String phoneNumber, String amount) async {
 //  try {
 //   String accessToken = await _getAccessToken();
 //   String timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
 //   String password = base64Encode(utf8.encode('$shortCode$consumerSecret$timestamp'));
 //
 //   var response = await http.post(
 //    Uri.parse(lipaNaMpesaOnlineUrl),
 //    headers: {
 //     'Authorization': 'Bearer $accessToken',
 //     'Content-Type': 'application/json',
 //    },
 //    body: json.encode({
 //     'BusinessShortCode': shortCode,
 //     'Password': password,
 //     'Timestamp': timestamp,
 //     'TransactionType': 'CustomerPayBillOnline',
 //     'Amount': amount,
 //     'PartyA': phoneNumber,
 //     'PartyB': shortCode,
 //     'PhoneNumber': phoneNumber,
 //     'CallBackURL': 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest',
 //     'AccountReference': 'TestPayment',
 //     'TransactionDesc': 'Payment for goods',
 //    }),
 //   );
 //
 //   if (response.statusCode == 200) {
 //    print('STK Push initiated successfully');
 //   } else {
 //    throw Exception('Failed to initiate STK Push: ${response.body}');
 //   }
 //  } catch (e) {
 //   print('Error in lipaNaMpesaOnline: $e');
 //   throw e;
 //  }
 // }
}
