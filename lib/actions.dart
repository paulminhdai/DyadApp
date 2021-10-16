import 'dart:convert';
import 'package:Dyad/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Fetch token from the number from man
Future<String> fetchToken(number) async {
  final response = await http.get(Uri.parse(serverURI + "/$number"));
  if (response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody[0]['tokenID'];
  } else {
    print("Can't load token");
    return "null";
  }
}

// Generate the token and save to server
Future<http.Response> postToken(token) async {
  Map data = {
    'tokenID': token
  };
  var body = json.encode(data);
  var response = await http.post(Uri.parse(serverURI),
      headers: {"Content-Type": "application/json"},
      body: body
  );
  //print(response.body);
  return response;
}