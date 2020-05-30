import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:io';
import 'package:async/async.dart';

class DriverApiService{

  String base_url = 'http://mltaxi.codeartweb.com/api/user/';

  Future getTotalRidesByAccessToken(String accessToken) async {
    final response = await http.get(base_url+"total-rides?access_token="+accessToken);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get getTotalRidesByAccessToken method');
    }
    
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['users'];
      return temp;
    } else {
      throw Exception('Failed to fetch wallet amount data API');
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
}