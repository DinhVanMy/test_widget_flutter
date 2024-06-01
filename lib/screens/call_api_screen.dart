import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApiScreen extends StatefulWidget {
  const CallApiScreen({super.key});

  @override
  State<CallApiScreen> createState() => _CallApiScreenState();
}

class _CallApiScreenState extends State<CallApiScreen> {

  String apiResponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  apiResponse = "Loading...";
                  setState(() {

                  });
                  callApi();
                },
                child: const Text("Hit API")),
            const SizedBox(height: 30,),
            Text(apiResponse)
          ],
        ),
      ),
    );
  }

  void callApi() async{
    try{
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if(response.statusCode == 200){
      apiResponse = jsonDecode(response.body)["products"][0]["description"];
    }
    else{
      apiResponse = "Something went wrong";

    }
    setState(() {
    });
    return;}
    catch(e) {
      apiResponse = "Error $e";
      setState(() {
      });
    }
  }
}
