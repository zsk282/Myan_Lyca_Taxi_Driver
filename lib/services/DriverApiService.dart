import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:io';
import 'package:async/async.dart';

class DriverApiService {
  String base_url = 'http://mltaxi.codeartweb.com/api/user/';

  Future getTotalRidesByAccessToken(String accessToken) async {
    final response = await http.get(
        base_url + "total-rides?access_token=" + accessToken + "&type=driver");
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

  Future getDriverRatingsByAccessToken(String accessToken) async {
    final response = await http
        .get(base_url + "over-all-rating?access_token=" + accessToken);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get over-all-rating method');
    }

    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      // temp = temp['users'];
      return temp;
    } else {
      throw Exception('Failed to fetch over-all-rating data API');
    }
  }

  Future weeklyGraphDataAPI(String accessToken) async {
    final response =
        await http.get(base_url + "earning-money?access_token=" + accessToken);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get over-all-rating method');
    }

    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      // temp = temp['users'];
      return temp;
    } else {
      throw Exception('Failed to fetch earning-money data API');
    }
  }

  Future nearByRequestsByAccessToken(
      String accessToken, double lat, double lng) async {
    print(base_url + "get-nearby-pending-request?access_token=" + accessToken);
    // final response = await http.get(base_url+"get-nearby-pending-request?access_token="+accessToken);
    final http.Response response = await http.post(
      base_url + "get-near-by-requests?access_token=" + accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json
          .encode({"latitude": lat.toString(), "longitude": lng.toString()}),
    );

    var temp;
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get nearByRequestsByAccessToken method');
    }

    if (temp['success'].toString() == 'true') {
      // temp = temp['data'];
      if (temp['message'] == "Record not found.") {
        return [];
      } else {
        return temp['data'];
      }
    } else {
      throw Exception('Failed to call nearByRequestsByAccessToken API');
    }
  }

  /* 
   * 0 == offline 1 == online
   */
  Future updateDriverStatusByAccessToken(String accessToken, int status) async {
    final http.Response response = await http.post(
      base_url + "update-driver-status?access_token=" + accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({"driver_status": status}),
    );
    var temp = json.decode(response.body);
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['driver_data'];
      return temp;
    } else {
      throw Exception('Failed to call updateDriverStatusByAccessToken API');
    }
  }

  Future<Map<String, dynamic>> updateUserByAccessToken(
      String accessToken, Map data) async {
    final http.Response response = await http.post(
      base_url + "edit-profile?access_token=" + accessToken,
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
      temp['auth_key'] =
          accessToken; //returning same auth key as this will be same but not returend in API
      return temp;
    } else {
      throw Exception('Failed to fetch login data API');
    }
  }

  Future updateDriverLocationByAccessToken(
      String accessToken, double lat, double lng) async {
    final http.Response response = await http.post(
      base_url + "update-driver-location?access_token=" + accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json
          .encode({"latitude": lat.toString(), "longitude": lng.toString()}),
    );
    var temp = json.decode(response.body);
    if (temp['success'].toString() == 'true') {
      print("Driver current location udpated to server");
    } else {
      throw Exception('Failed to update drivers current location');
    }
  }

  Future getUserWalletAmountByAccessToken(String accessToken) async {
    final response =
        await http.get(base_url + "wallet-balance?access_token=" + accessToken);
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

  Future getDocumentType(String accessToken) async {
    final response =
        await http.get(base_url + "get-doc-types?access_token=" + accessToken);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call getDocumentType method');
    }

    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['document_type'];
      return temp;
    } else {
      throw Exception('Failed to getDocumentType data API');
    }
  }

  Future getUploadedDocuments(String accessToken) async {
    final response =
        await http.get(base_url + "get-documents?access_token=" + accessToken);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call getDocumentType method');
    }

    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      temp = temp['documents'];
      return temp;
    } else {
      return null;
    }
  }

  Future acceptRideFromDriverEnd(String accessToken, String bookingId) async {
    final http.Response response = await http.post(
      base_url + "accept-ride-from-driver?access_token=" + accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({
        "booking_id": bookingId,
        "status": "6" //hardocoded 6 for status driver accpeted the ride
      }),
    );

    var temp = json.decode(response.body);
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      return temp;
    } else {
      throw Exception('Failed to call acceptRideFromDriverEnd API');
    }
  }

  Future updateTrip(String accessToken, String bookingId, String status) async {
    final http.Response response = await http.post(
      base_url + "update-status?access_token=" + accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({"booking_id": bookingId, "status": status}),
    );

    var temp = json.decode(response.body);
    if (temp['success'].toString() == 'true') {
      temp = temp['data'];
      return temp;
    } else {
      throw Exception('Failed to call cancleTrip API');
    }
  }

  Future performWithdrawlRequestByAccessToken(
      String accessToken, String driverId, String amount) async {
    final http.Response response = await http.post(
      base_url + "withdrawal-request?access_token=" + accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({"user_id": driverId, "amount": amount}),
    );

    var temp = json.decode(response.body);
    print(temp);
    if (temp['success'].toString() == 'true') {
      // temp = temp['data'];
      return true;
    } else {
      return false;
    }
  }
}
