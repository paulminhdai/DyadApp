import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'constants.dart';

class manScreen extends StatefulWidget {
  const manScreen({Key? key}) : super(key: key);

  @override
  _manScreenState createState() => _manScreenState();
}

class _manScreenState extends State<manScreen> {
  var token = '';
  @override
  void initState() {
    super.initState();
    configOneSignal();
  }

  void configOneSignal() {
    OneSignal.shared.init(oneSignalID);
  }

  Future<void> getToken() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    String tokenId = status.subscriptionStatus.userId;
    token = tokenId;
    print(token);
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
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                    textColor: Colors.white,
                    color: Colors.lightBlue[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text('Generate the pair code'),
                    onPressed: getToken
                  ),
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
                    "2526",
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
                  onPressed: () { },
                  child: Text('Generate new code?'),
                )
              ],
            )
      )
    );
  }
}
