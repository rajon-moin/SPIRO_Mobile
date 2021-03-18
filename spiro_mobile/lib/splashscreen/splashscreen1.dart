import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spiro_mobile/account/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    TypewriterAnimatedTextKit(
      speed: Duration(milliseconds: 2000),
      totalRepeatCount: 4,
      text: ["FOR STUDENT", "BY STUDENT"],
      textStyle: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
      pause: Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/images/bg.jpg"),
          //         fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Image.asset(
                "assets/images/favicon1.png",
                height: 100,
                width: MediaQuery.of(context).size.width,
              )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "SPIRO",
                  ],
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    letterSpacing: 4.0,
                  ),
                  colors: [
                    Colors.red,
                    Colors.red,
                    Colors.red,
                    Colors.white,
                    Colors.blue,
                  ],
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset("assets/animation/study.json"),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ColorizeAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "FOR STUDENT",
                    "BY STUDENT",
                  ],
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    letterSpacing: 4.0,
                  ),
                  colors: [
                    Colors.red,
                    Colors.red,
                    Colors.red,
                    Colors.white,
                    Colors.blue,
                  ],
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}
