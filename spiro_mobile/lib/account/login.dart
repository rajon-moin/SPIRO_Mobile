import 'package:flutter/material.dart';
import 'package:spiro_mobile/customwidgets/inputIcon.dart';
import 'package:spiro_mobile/customwidgets/outlinebutton.dart';
import 'package:spiro_mobile/customwidgets/primarybutton.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:lottie/lottie.dart';
import 'package:spiro_mobile/pageview.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;
  double _animationOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeight = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeight = windowHeight - 270;
    _registerHeight = windowHeight - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Colors.red;

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _animationOpacity = 1;

        _loginYOffset = windowHeight;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 1:
        _backgroundColor = Colors.red[900];
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _animationOpacity = 0;

        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;

        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;
      case 2:
        _backgroundColor = Colors.red[900];
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _animationOpacity = 0;

        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;

        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
        break;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              color: _backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 1000),
                            margin: EdgeInsets.only(
                              top: _headingTop,
                            ),
                            child: Text(
                              "SPIRO",
                              style: TextStyle(
                                color: _headingColor, fontSize: 55,
                                fontWeight: FontWeight.bold,
                                // color: Colors.white,
                                letterSpacing: 20.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              "We make learning easy \n Join SPIRO to learn for free.",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: _headingColor, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Opacity(
                          opacity: _animationOpacity,
                          child: Lottie.asset(
                              "assets/animation/onlineclass.json")),
                    ),
                  ),
                  Container(
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
                        margin: EdgeInsets.all(32),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.red[900],
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            height: _loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Login To Continue",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: "Enter Email...",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: "Enter Password...",
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: PrimaryButton(
                        btnText: "Login",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlineBtn(
                        btnText: "Create New Account",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AnimatedContainer(
            height: _registerHeight,
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Create a New Account",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: "Enter Email...",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: "Enter Password...",
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    PrimaryButton(
                      btnText: "Create Account",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 1;
                        });
                      },
                      child: OutlineBtn(
                        btnText: "Back To Login",
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
