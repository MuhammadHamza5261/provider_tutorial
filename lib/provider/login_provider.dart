import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class AuthProvider with ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value){

    _isLoading = value;

  }


  void login(String email, String password) async{

    setLoading(true);

    try{

      final response = await http.post(Uri.parse('https://reqres.in/api/login'),
        headers: <String, String>{
        "Content-type": "application/json",
         "Accept": "application/json",
        },
        body: {

          "email": email,
          "password": password,
        }

      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        print(data);
        setLoading(false);
      }

      else{
        setLoading(false);
        print('Failed');
      }



    }
        catch(e){
          print(e.toString());

        }




  }







}