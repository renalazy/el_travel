import 'package:eltravel/Animation/FadeAnimation.dart';
import 'package:eltravel/homeScreen.dart';
import 'package:eltravel/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eltravel/CustomTextField.dart';
import 'package:eltravel/RaisedGradientButton.dart';
import 'package:eltravel/EmailValidator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(RegisterScreen());
  });
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      routes: {
        '/loginscreen': (_) => new LoginScreen(),
        '/homescreen': (_) => new HomeScreen(),
      },
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  Widget filledButton(String text, void function()) {
    return RaisedGradientButton(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'MontserratAlternates',
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      gradient: LinearGradient(colors: [
        Color.fromRGBO(143, 148, 251, 1),
        Color.fromRGBO(143, 148, 251, .6),
      ]),
      onPressed: () {
        function();
      },
    );
  }

  Future<void> _validateRegisterInput() async {
    final FormState form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      fontFamily: 'MontserratAlternates',
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: [
                                CustomTextField(
                                  onSaved: (input) {
                                    _email = input;
                                  },
                                  validator: emailValidator,
                                  hint: "Email Address",
                                ),
                                CustomTextField(
                                  obsecure: true,
                                  onSaved: (input) => _password.text = input,
                                  validator: (input) =>
                                      input.isEmpty ? "*Required" : null,
                                  hint: "Password",
                                ),
                                CustomTextField(
                                  obsecure: true,
                                  onSaved: (input) =>
                                      _confirmPassword.text = input,
                                  validator: (input) {
                                    if (input.isEmpty) return "*Required";
                                    if (input != _password.text)
                                      return "Not Match";
                                    return null;
                                  },
                                  hint: "Confirm Password",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        filledButton("REGISTER", () {
                          _validateRegisterInput();
                        }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.5,
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/loginscreen',
                                  (Route<dynamic> route) => true);
                            },
                            child: Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: 'MontserratAlternates',
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  decoration: TextDecoration.underline),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
