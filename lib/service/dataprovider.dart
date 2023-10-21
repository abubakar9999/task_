import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_task/service/apis.dart';

class DataProvider {
//************************ sing up******************* */

  Future singUP(
      String name,
      email,
      phone,
      countrycode,
      gender,
      dob,
      int divisionId,
      districId,
      adderss,
      String password,
      macadderss,
      photo) async {
    final http.Response response;

    response = await http.post(
      Uri.parse(ApiList.loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "email": email,
        "country_code": countrycode,

        "phone": phone,
        "gender": gender,
        "dob": dob,
        "division_id": divisionId,
        "district_id": districId,
        "address": adderss,
        "password": macadderss,
        "profile_photo": photo // base64
      }),
    );

    return response;
  }

//************************ Log in ******************* */
  Future login(String phone, password, macAdderss) async {
    final http.Response response;

    response = await http.post(
      Uri.parse(ApiList.loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "phone": phone,
        "password": password,
        "mac_address": macAdderss
      }),
    );

    return response;
  }

  //************************ Home ******************* */
  Map home()   {
    Map response = {
      "name": "Mashrafee Bin Mortaza",
      "email": "mash1@gmail.com   ",
      "country_code": "+880",
      "phone": "1671720228",
      "gender": "Male",
      "dob": "2023-09-10",
      "division_id": 6,
      "district_id": 44,
      "address": "Tangail",
      "password": "12345678",
      "mac_address": "00-B0-D0-63-C2-26",
      "profile_photo": "" // base64
    };

    return response;
  }
}
