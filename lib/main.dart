import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // color: Colors.,
        theme: ThemeData(fontFamily: 'Florence'),
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Container(child: LoginPage())));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Colors.black;

  double _headingTop = 70;

  double _loginYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Colors.black;
        _loginYOffset = windowHeight;
        _headingTop = 70;
        break;
      case 1:
        _backgroundColor = Colors.black;
        _headingColor = Colors.white;
        _loginYOffset = 250;
        _headingTop = 80;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            color: _backgroundColor,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       _pageState = 1;
                  //     });
                  //   }
                  // ),
                  Container(
                      //  padding: EdgeInsets.fromLTRB(73,0,0,0),
                      child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Padding(
                            padding: EdgeInsets.only(left: 67),
                            child: Text('MUBI',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: _headingColor,
                                )),
                          )),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'WATCH',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 25,
                            color: _headingColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('HAND-PICKED',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 25,
                              color: _headingColor,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text('CINEMA',
                            style: TextStyle(
                              fontSize: 25,
                              color: _headingColor,
                            )),
                      )
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.fromLTRB(32, 20, 80, 200),
                    child: Image.asset(
                        'assets/images/mubi black on white cropped.png',
                        fit: BoxFit.contain,
                        width: 150,
                        height: 100),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                  )
                ])),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 0;
            });
          },
          child: AnimatedContainer(
              padding: EdgeInsets.all(32),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(
                milliseconds: 700,
              ),
              transform: Matrix4.translationValues(0, _loginYOffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Login To Continue",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        )
                      )
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                              child: Icon(Icons.email,
                              size: 20,
                              color: Colors.black),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter your email"
                                )
                              )
                            )
                          ],
                        )
                      )
                    ], 
                  ),
                  SizedBox(height: 20),

                  Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 40,
                              child: Icon(Icons.vpn_key,
                              size: 20,
                              color: Colors.black),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Enter your password"
                                )
                              )
                            )
                          ],
                        )
                      ),
                      SizedBox(height: 40),
                    PrimaryButton(btnText: "Login"),
                    SizedBox(height: 20),
                    Row(
    children: <Widget>[
        Expanded(
            child: Divider(color: Colors.black,
            height: 20)
        ),       

        Text("OR",),        

        Expanded(
            child: Divider(color: Colors.black,
            height: 20)
        ),
    ]
),
                      SizedBox(height: 10),
                    Text('Sign Up',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  ]),
                ],
              )),
        )
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({required this.btnText});

  // const PrimaryButton({Key? key}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(widget.btnText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              )),
        ));
  }
}


