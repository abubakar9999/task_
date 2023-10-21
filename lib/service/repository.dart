import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview_task/service/dataprovider.dart';


class Repository {

Future<Response> singUp(String name, email, phone, countrycode,gender,dob,int divisionId,districId,adderss, String password,macadderss,photo) async {
 
    try {
      final Response res = await DataProvider().singUP( name, email, phone, countrycode,gender,dob, divisionId,districId,adderss, password,macadderss,photo);

      return res;
     
    } catch (e) {
      debugPrint('Repositories.login() func error: $e');
    }
    return Response("null", 404);
  }  
Future<Response> login(String phone, password, macadderss) async {
 
    try {
      final Response res = await DataProvider().login(phone, password, macadderss);

      return res;
     
    } catch (e) {
      debugPrint('Repositories.login() func error: $e');
    }
    return Response("null", 404);
  }  
}