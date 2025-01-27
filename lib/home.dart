import 'dart:convert';

import 'package:api3/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  user_model showdatalist = user_model();
  getdataapi()async{
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print(response.body);

      if (response.statusCode == 200) {
        print('sucess');

        var data = jsonDecode(response.body.toString());
        setState(() {
          showdatalist =user_model.fromJson(data);
        });
        
        
      }
  }
@override
  void initState() {
    // TODO: implement initState
    setState(() {
      getdataapi();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}