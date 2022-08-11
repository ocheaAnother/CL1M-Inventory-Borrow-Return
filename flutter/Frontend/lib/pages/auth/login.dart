import 'package:Login/pages/borrower_page.dart';
import 'package:flutter/material.dart';
import 'package:Login/api/user/login.dart';
import 'package:Login/main.dart';
import 'package:Login/pages/auth/signup.dart';

//Basically the Login Page Contains a form That is not the best form since main focus was on Logic

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up"),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Email is required';
                        }
                      },
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Password is required';
                        }
                      },
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MaterialApp(
                                            home: Signup(),
                                          )));
                            },
                            child: Text("Signup Page")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!_formkey.currentState!.validate()) {
                                return;
                              }
                              print(_email);
                              LoginUser('${_email}', '${_password}')
                                  .then(((value) {
                                if (value) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const MaterialApp(
                                                  home: Dashboard())),
                                      (route) => false);
                                }
                              }));
                            },
                            child: Text("Log in")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
