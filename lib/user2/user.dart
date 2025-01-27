import 'dart:convert';

import 'package:api3/user2/user_model.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/user2/user_model2.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  user_model2 user =user_model2();
  getdatauser()async{
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode==200) {
      
      var data = jsonDecode(response.body.toString());
      setState(() {
        user =user_model2.fromJson(data);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getdatauser();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
        Text(user.data![0].firstName.toString()),
         Text(user.data![1].firstName.toString()),
          Text(user.support!.text.toString())
        ],),
      ),
    );
  }
}