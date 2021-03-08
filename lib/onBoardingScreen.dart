import 'dart:async';
import 'package:eltravel/CustomDialog.dart';
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
          image: AssetImage('images/hello.gif'),
          buttonText: 'Get Started',
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

