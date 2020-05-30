import 'dart:convert';
import 'package:http/http.dart' as http;

class CabTypeService{

  String base_url = 'http://mltaxi.codeartweb.com/api/user/';

  Future getAvailableCabs(String accessToken) async {
    final http.Response response = await http.post(
      base_url+'all-cars?access_token='+accessToken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      }
    );

    var temp = json.decode(response.body);

    if (temp['success'].toString() == "true") {
      temp = temp['data'];
      return temp;
    } else {
      throw Exception('Failed to fetch Login Nearby cabs TYPES by API');
    }
  }

  Future getNearbyCabs(String accesstoken, String lat, String lng) async {
    final http.Response response = await http.post(
      base_url+'get-available-cars?access_token='+accesstoken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({
        "latitude":lat,
        "longitude":lng
      }),
    );
    var temp = json.decode(response.body);

    if (temp['success'].toString() == "true") {
      temp = temp['data'];
      return temp;
    } else {
      throw Exception('Failed to fetch Login Nearby cabs by API');
    }
  }

  Future createTripID(
    String accesstoken,
    String car_type_id,
    String pick_add,
    String pick_lat,
    String pick_lng,
    String drop_add,
    String drop_lat,
    String drop_lng,
    String payment_type,
    ) async {
    final http.Response response = await http.post(
      base_url+'booking-ride?access_token='+accesstoken,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
      body: json.encode({
        "car_type_id": car_type_id,
        "source_add": pick_add,
        "source_lat": pick_lat,
        "source_long": pick_lng,
        "destination_add": drop_add,
        "destinatin_lat": drop_lat,
        "destination_long": drop_lng,
        "payment_type": payment_type,
      }),
    );
    var temp = json.decode(response.body);
    print(temp);

    if (temp['success'].toString() == "true") {
      temp = temp['data'];
      return temp;
    } else {
      throw Exception('Failed to create trip by API');
    }
  }

  Future getBookingIdDataByAccessToken(String accessToken, String bookingID) async {
    print(base_url+"get-booking-data?access_token="+accessToken+"&booking_id="+bookingID);
    final response = await http.get(base_url+"get-booking-data?access_token="+accessToken+"&booking_id="+bookingID);
    var temp;

    if (response.statusCode == 200) {
      temp = json.decode(response.body);
    } else {
      throw Exception('Failed call get getBookingIdDataByAccessToken method');
    }
    
    temp = temp['data'];
    if (temp['success'].toString() == 'true') {
      temp = temp['bookingData'];
      return temp;
    } else {
      throw Exception('Failed call get getBookingIdDataByAccessToken method');
    }
  }
}