import 'dart:convert';

import 'package:api3/user1/user_model.dart';
//import 'package:api3/user_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
//import 'package:flutter_application_1/user1/user_model.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  user_model user = user_model();

  getdata()async{
var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

print(response.body);
if (response.statusCode== 200) {
  var data = jsonDecode(response.body.toString());
  setState(() {
    
  user = user_model.fromJson(data);
  });
  
}
  }
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(user.userId.toString()),
            Text(user.title.toString()),
            SizedBox(height: 20,),
            Text(user.body.toString())
            
          ],
        ),
      ),
    );
  }
}