import 'dart:convert';

import 'package:Dyad/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class womanScreen extends StatefulWidget {
  const womanScreen({Key? key}) : super(key: key);

  @override
  _womanScreenState createState() => _womanScreenState();
}

class _womanScreenState extends State<womanScreen> {
  var token = "c9080c83-61f1-4093-ba9e-9f05c38dd3ad";

  Future<Response> sendNotification(List<String> tokenIdList, String contents, String heading) async{

    return await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>
      {
        "app_id": oneSignalID,//the App Id that one get from the OneSignal When the application is registered.
        "include_player_ids": tokenIdList,//tokenIdList Is the List of All the Token Id to to Whom notification must be sent.
        // android_accent_color represent the color of the heading text in the notification
        "android_accent_color":"FF9976D2",
        "small_icon":"ic_stat_onesignal_default",
        "large_icon":"https://www.filepicker.io/api/file/zPloHSmnQsix82nlj9Aj?filename=name.jpg",
        "headings": {"en": heading},
        "contents": {"en": contents},
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: Colors.lightBlue[400],
              ),
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: token.isEmpty
              ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter the code from",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.lightBlue[400]
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "your man",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Colors.lightBlue[400]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.only(bottom: 30),
                  child: TextField(
                    obscureText: false,
                      style: TextStyle(
                          fontSize: 14,
                          height: 0.7,
                          color: Colors.black
                      ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the code',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 60, right: 60),
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                      textColor: Colors.white,
                      color: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Text('Enter'),
                      onPressed: () {

                      }
                    ),
                  ),
                ],
              )
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Need from your Man?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.lightBlue[400]
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180.0,
                      height: 180.0,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                          textColor: Colors.white,
                          color: Colors.lightGreen[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('I\'m hungry'),
                          onPressed: () {
                              sendNotification([token], 'I\'m hungry', 'Hey honey!');
                          }
                      ),
                    ),
                    Container(
                      width: 180.0,
                      height: 180.0,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          textColor: Colors.white,
                          color: Colors.cyan[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('I want Bubble Tea'),
                          onPressed: () {
                            sendNotification([token], 'I want Bubble Tea', 'Hey honey!');
                          }
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180.0,
                      height: 180.0,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          textColor: Colors.white,
                          color: Colors.pink[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('Miss yo'),
                          onPressed: () {
                            sendNotification([token], 'Miss yo', 'Hey honey!');
                          }
                      ),
                    ),
                    Container(
                      width: 180.0,
                      height: 180.0,
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          textColor: Colors.white,
                          color: Colors.purple[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('Call me plsss'),
                          onPressed: () {
                            sendNotification([token], 'Call me plsss', 'Hey honey!');
                          }
                      ),
                    ),
                  ],
                ),
              ]
            )
        )
    );
  }
}
