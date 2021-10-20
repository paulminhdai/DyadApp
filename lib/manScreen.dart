import 'dart:convert';

import 'package:Dyad/actions.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class manScreen extends StatefulWidget {
  const manScreen({Key? key}) : super(key: key);

  @override
  _manScreenState createState() => _manScreenState();
}

class _manScreenState extends State<manScreen> {

  var _number = "";
  bool _isLoading = false;

  // load number from local storage
  void _loadNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _number = (prefs.getString('number') ?? "");
    });
  }

  @override
  void initState() {
    super.initState();
    configOneSignal();
    _loadNumber();
  }

  // OneSignal config
  void configOneSignal() {
    OneSignal.shared.init(oneSignalID);
  }

  Future<void> getNumber() async {
    setState(() {
      _isLoading = true;
    });
    // OneSignal Permission
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    String tokenId = status.subscriptionStatus.userId;

    // Post token and get number from APIs
    var response = await postToken(tokenId);
    var responseBody = json.decode(response.body);

    // Save number to local storage
    final prefs = await SharedPreferences.getInstance();
    var returnNumber = responseBody["number"].toString();
    if (returnNumber.isNotEmpty)
      prefs.setString('number', returnNumber);

    setState(() {
      _number = responseBody["number"].toString();
      _isLoading = false;
    });
  }

  void removeNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('counter');
      _number = "";
    });

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
        body: _number.isEmpty
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Haven't had a code yet?!?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.lightBlue[400]
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 60, right: 60),
                  child: _isLoading ?
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                  ):
                  RaisedButton(
                    padding: EdgeInsets.all(15),
                      textColor: Colors.white,
                      color: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Text('Generate the pair code'),
                      onPressed: getNumber
                  )
                ),
              ],
            )
            :  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your pair code is:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.lightBlue[300]
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 60, right: 60),
                  child: Text(
                    _number,
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[400],
                    ),
                  )
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue.shade300),
                  ),
                  onPressed: removeNumber,
                  child: Text('Generate new code?'),
                )
              ],
            )
      )
    );
  }
}
