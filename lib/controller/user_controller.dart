import 'dart:convert';

import 'package:belajar/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserController {
  
final String baseurl = 'https://reqres.in/api/users';

  Future<UserModelResponse> createUserService(UserModelResponse user) async{
    final response = await http.post(Uri.parse('$baseurl'),
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201){
      return UserModelResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to create data!');
    }
  }

  Future<void> createUser(BuildContext context, String name, String job) async{
    UserModelResponse newUser = UserModelResponse(name: name, job: job);

    UserModelResponse user = await createUserService(newUser);

    showDialog(
      context: context, 
      builder:(BuildContext context) => AlertDialog(
        title: Text('Success'),
        content: Text(user.toString()),
      )
      
      );


  }
}