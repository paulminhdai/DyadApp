import 'package:flutter/material.dart';

class womanScreen extends StatefulWidget {
  const womanScreen({Key? key}) : super(key: key);

  @override
  _womanScreenState createState() => _womanScreenState();
}

class _womanScreenState extends State<womanScreen> {
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
            // body:  Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "Enter the code from",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 25,
            //                 color: Colors.lightBlue[400]
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             margin: EdgeInsets.only(bottom: 10),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   "your man",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 50,
            //                       color: Colors.lightBlue[400]
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Container(
            //       width: 250,
            //       margin: EdgeInsets.only(bottom: 30),
            //       child: TextField(
            //         obscureText: false,
            //           style: TextStyle(
            //               fontSize: 14,
            //               height: 0.7,
            //               color: Colors.black
            //           ),
            //         decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           labelText: 'Enter the code',
            //         ),
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(bottom: 10, left: 60, right: 60),
            //       child: RaisedButton(
            //         padding: EdgeInsets.all(15),
            //           textColor: Colors.white,
            //           color: Colors.lightBlue[300],
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18.0),
            //           ),
            //           child: Text('Enter'),
            //           onPressed: () {
            //
            //           }
            //         ),
            //       ),
            //     ],
            //   )
          body:  Column(
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
                    width: 150.0,
                    height: 150.0,
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

                        }
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
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

                        }
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.0,
                    height: 150.0,
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

                        }
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
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
