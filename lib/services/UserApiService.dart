import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:io';
import 'package:async/async.dart';

class UserApiService{

  String base_url = 'http://mltaxi.codeartweb.com/api/user/';

  Future<Map<String,dynamic>> getUserByAccessToken(String accessToken) async {
    final response = await http.get(base_url+"user-data?access_token="+accessToken);
    var temp; 

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get getUserByAccessToken method');
    }
    
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['user'];
      return temp;
    } else {
      throw Exception('Failed to fetch login data API');
    }
  }

  Future<Map<String,dynamic>> updateUserByAccessToken(String accessToken,Map data) async {
    final http.Response response = await http.post(
      base_url+"edit-profile?access_token="+accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode(data),
    );
    var temp = json.decode(response.body);
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['user'];
      temp['auth_key'] = accessToken; //returning same auth key as this will be same but not returend in API
      return temp;
    } else {
      throw Exception('Failed to fetch login data API');
    }
  }

  // Future<Map<String,dynamic>> updateImageByAccessToken(String accessToken, filename, url) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(await http.MultipartFile.fromPath('picture', filename));
  //   var response = await request.send();
  //   print(response.reasonPhrase);
  //   return null;
  //   // var temp = json.decode(response.reasonPhrase);
    
  //   // if (temp['success'].toString() == 'true') {
  //   //   temp = temp['data'];
  //   //   temp = temp['user'];
  //   //   return temp;
  //   // } else {
  //   //   throw Exception('Failed to fetch login data API');
  //   // }
  // }

  updateImageByAccessToken(String accessToken, imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse(base_url+"upload-image?access_token="+accessToken));
    request.files.add(await http.MultipartFile.fromPath('Users[avatar]', imageFile));
    
    var response  = await request.send();
    var respStr  = await response.stream.bytesToString();
    
    var temp = json.decode(respStr);

    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['user'];
      temp['id'] = "108";
      return temp;
    } else {
      throw Exception('Failed to fetch login data API');
    }
  }

  Future getUserWalletAmountByAccessToken(String accessToken) async {
    final response = await http.get(base_url+"wallet-balance?access_token="+accessToken);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get getwalletAmountByAccessToken method');
    }
    
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      return temp;
    } else {
      throw Exception('Failed to fetch wallet amount data API');
    }
  }
  
  Future getUserWalletTransactionsByAccessToken() async {
    return  http.get(base_url+"payments-details?access_token=952809de3d65d80c4562e2546eb61c29");
    // var temp;

    // if (response.statusCode == 200) {
    //   temp = json.decode(response.body);
    // } else {
    //   throw Exception('Failed call get getwalletAmountByAccessToken method');
    // }
    
    // if (temp['success'].toString() == 'true') {
    //   temp = temp['data'];
    //   return temp;
    // } else {
    //   throw Exception('Failed to fetch wallet amount data API');
    // }
  }
}