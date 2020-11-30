/**
 * Call API and get resposne from there no modification here in response other than parsing
 */
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApiService {
  String base_url = 'http://3.128.103.238/api/';
  Future<String> getOTP(
      String countryMobileCode, String mobileNumber, String deviceId) async {
    print(base_url + 'login/index');
    final http.Response response = await http.post(
      base_url + 'login/index',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: jsonEncode({
        "Users": {
          "mobile": mobileNumber,
          "device_id": deviceId,
          "device_token": ""
        }
      }),
    );
    var temp = json.decode(response.body);
    print(temp);
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['user'];
      temp = temp['otp'].toString();
      return temp;
    } else {
      // var otp = await this.registerUser(countryMobileCode, mobileNumber, deviceId);
      return null;
      // throw Exception('Failed to fetch login data API');
    }
  }

  Future<String> registerUser(
      String countryCode, String mobileNumber, String deviceId) async {
    final http.Response response = await http.post(
      base_url + 'register/sign-up',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: jsonEncode({
        "Users": {
          "first_name": "",
          "last_name": "",
          "email": "",
          "countryCode": countryCode,
          "mobile": mobileNumber,
          "device_id": deviceId
        }
      }),
    );

    var temp = json.decode(response.body);
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['user'];
      temp = temp['otp'].toString();
      return temp;
    } else {
      throw Exception('Failed to fetch user and also unable to register');
    }
  }

  Future<String> validateOTP(String mobile, String otp) async {
    final http.Response response = await http.post(
      base_url + 'login/verify-otp',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({
        "MobileLoginForm": {"username": mobile, "otp": otp}
      }),
    );
    var temp = json.decode(response.body);
    print("MAINA LOGIN");
    print(temp);

    if (temp['success'].toString() == "true") {
      temp = temp['data'];
      temp = temp['users'];
      temp = temp['auth_key'];
      return temp;
      // return 'c8c1977ee9712f1a4b3dc1f54757c47c';//temp;
    } else {
      return null;//temp;
      // return 'c8c1977ee9712f1a4b3dc1f54757c47c';//temp;
      // throw Exception('Failed to fetch Login step 2 data API');
    }
  }
}
