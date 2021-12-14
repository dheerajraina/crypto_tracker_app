import 'dart:convert';
import 'dart:io';

import 'package:crypto_tracker/main.dart';

import 'package:http/http.dart' as http;

import 'package:crypto_tracker/utilities/keys.dart';


class APIService {
  
  APIService._instantiate();

  static final APIService instance =APIService._instantiate();


   final String _baseUrl='https://rest.coinapi.io/v1/assets';


  Future<List> readJson() async{
    final  response =await http.get(
      Uri.parse(_baseUrl),
      headers:{
      HttpHeaders.authorizationHeader:API_KEY,
      HttpHeaders.connectionHeader:'application/json',
    },);

    if(response.statusCode==200){

      final data =await json.decode(response.body);

       return data;

    }
    else{
      throw json.decode(response.body)['error']['message'];
    }
    
  }


}

