import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:interview_task/service/apis.dart';

class DataProvider {

 Future singUP(String name, email, phone, countrycode,gender,dob,int divisionId,districId,adderss, String password,macadderss,photo) async {
    final http.Response response;

    response = await http.post(
      Uri.parse(ApiList.loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name" :name,
    "email" : email,
    "country_code" : countrycode,
  
    "phone" : phone,
    "gender" : gender,
    "dob" :  dob,
    "division_id" : divisionId,
    "district_id" : districId,
    "address" : adderss,
    "password" : macadderss,
    "profile_photo" :photo// base64
        }),
    );

    return response;
  }

 Future login(String phone,password,macAdderss) async {
    final http.Response response;

    response = await http.post(
      Uri.parse(ApiList.loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"phone": phone, "password": password, "mac_address": macAdderss}),
    );

    return response;
  }
  
}