import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const apiKey = "AIzaSyCCGeITRzeGBOrjDEaVqwM0H6Ug-NtqmcU";

class GoogleMapsServices{
  Future<Map<String, dynamic>> getRouteCoordinates(LatLng l1, LatLng l2)async{
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
    print(url);
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return { "route": values["routes"][0]["overview_polyline"]["points"], "distance": values["routes"][0]["legs"][0]["distance"]["value"]};
  }
  
  Future autocompletePlacesByName(String keyword, double lat, double lng) async {
    String language = 'en';
    List results = [];

    // String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$keyword&types=geocode&language=$language&key=$apiKey";
    // String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$keyword&types=geocode&language=$language&components=country:in&key=$apiKey";
    String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&radius=50000&query=$keyword&key=$apiKey";
    print(url);
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(values);
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    if(values["results"].length > 0){
      for(var i=0; i < values["results"].length; i++){
        results.add({
          "name": values["results"][i]["name"],
          "place_id": values["results"][i]["place_id"],
          "lat": values["results"][i]["geometry"]["location"]["lat"],
          "lng": values["results"][i]["geometry"]["location"]["lng"],
        });  
      }
    }
    return results;//values["routes"][0]["overview_polyline"]["points"];
  }
  
  Future latLngByPlaceId(String placeid) async {
    String url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeid&fields=geometry&key=$apiKey";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["result"]["geometry"]["location"];
  }
}