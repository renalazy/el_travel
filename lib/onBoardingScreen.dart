import 'dart:async';

import 'package:eltravel/homeScreen.dart';
import 'package:eltravel/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(OnBoardingScreen());
  });
}

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
      routes: {
        '/loginscreen': (_) => new LoginScreen(),
      },
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();
    Timer.run(() => _showAlert(context));
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CustomDialog(
              title: 'Welcome',
              description: 'Lets Travel the World With Us !',
            ));
  }

  final pages = [
    SkOnboardingModel(
        title: 'Easy Planning',
        description: 'Easily find your grocery items and you will get delivery '
            'in wide range',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/travel_plans.png'),
    SkOnboardingModel(
        title: 'Travel the World',
        description: 'Easily find your grocery items and you will get delivery '
            'in wide range',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/travel_adventure.png'),
    SkOnboardingModel(
        title: 'Meet New Travelmate',
        description: 'Easily find your grocery items and you will get delivery '
            'in wide range',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/travel_friends.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xff6C63FF),
        pages: pages,
        skipClicked: (value) {
          Navigator.pushReplacementNamed(context, '/loginscreen');
        },
        getStartedClicked: (value) {
          Navigator.pushReplacementNamed(context, '/loginscreen');
        },
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, butnoTetxt;
  final Image image;

  CustomDialog({this.title, this.description, this.butnoTetxt, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 100.0,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 60),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                description,
                style: TextStyle(
                    fontFamily: 'MontserratAlternates', fontSize: 16.0),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  color: Color(0xff6C63FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontFamily: 'MontserratAlternates',
                        color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 85,
            backgroundImage: AssetImage('images/hello.gif'),
          ),
        ),
      ],
    );
  }
}
