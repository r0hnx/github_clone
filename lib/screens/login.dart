import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double width, height;
  bool isPasswordNotVisible = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    return Scaffold(
      key: _key,
      body: Container(
        width: double.infinity,
        height: height,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Theme(
              data: ThemeData(
                primaryColor: Colors.black,
              ),
              child: Column(
                children: [
                  SizedBox(height: height * .12),
                  Image.asset('assets/github.png'),
                  SizedBox(height: height * .03),
                  Text(
                    'Sign in to Github',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * .1),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        hintText: "User name or email...",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7)))),
                  ),
                  SizedBox(height: height * .02),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        hintText: 'Password...',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isPasswordNotVisible = !isPasswordNotVisible;
                              });
                            },
                            child: Icon((isPasswordNotVisible)
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    obscureText: isPasswordNotVisible,
                  ),
                  SizedBox(height: height * .03),
                  Row(
                    children: [
                      Text('Forgot password?',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: height * .03),
                  RaisedButton(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .35, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      //handle login
                    },
                    child: Text(
                      "Sign in",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
