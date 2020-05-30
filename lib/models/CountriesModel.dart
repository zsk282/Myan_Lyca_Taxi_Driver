import 'package:flutter/material.dart';

class CountriesModel {
  String iso;
  String name;
  String phone;
  String icon;
  
  CountriesModel(this.iso,this.name,this.phone,this.icon);

  CountriesModel.fromJson(Map<String, dynamic> parsedJson){
    iso = parsedJson['iso'];
    name = parsedJson['name'];
    phone = parsedJson['phone'];
    icon = parsedJson['icon'];
  }
}