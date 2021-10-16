import 'package:Dyad/manScreen.dart';
import 'package:Dyad/womanScreen.dart';
import 'package:flutter/material.dart';
//https://sanjay144.medium.com/how-to-send-notification-from-device-to-device-in-flutter-7a47c911d66
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BearNeed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.network('https://i.stack.imgur.com/y9DpT.jpg'),
            Image.asset(
              "assets/images/couple.png",
              width:200,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30, top:30),
              alignment: Alignment.center,
              child: Text(
                "Interact With your Love One",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.lightBlue[400]
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 200,
              height: 50,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.lightBlue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text('Man'),
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => manScreen())
                    );
                  }
                )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 200,
              height: 50,
              child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text('Woman'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => womanScreen())
                    );
                  }
              )
            ),
          ],
        ),
        ),
    );
  }
}
