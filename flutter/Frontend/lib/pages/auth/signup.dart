import 'package:Login/pages/borrower_page.dart';
import 'package:flutter/material.dart';
import 'package:Login/api/user/register.dart';
import 'package:Login/main.dart';
import 'package:Login/pages/auth/login.dart';

//Basically the Login Page Contains a form That is not the best form since main focus was on Logic
//Yes I copied the above comment from Login 😊

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //This is to store FormState don't know anything about it but its important🙂
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //These Variables Store Form Data
  String? _name, _email, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      decoration: InputDecoration(labelText: "Name"),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Name is required';
                        }
                      },
                      onChanged: (value) {
                        _name = value;
                      },
                    ),
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
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "Confirm Password"),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (value != _password) {
                          return 'Password not same';
                        }
                      },
                      onChanged: (value) {
                        _confirmPassword = value;
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
                                          const MaterialApp(
                                            home: Dashboard(),
                                          )));
                            },
                            child: Text("Login Page")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!_formkey.currentState!.validate()) {
                                return;
                              }
                              print(_name);
                              RegisterUser(
                                      '${_name}', '${_email}', '${_password}')
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
                            child: Text("Sign Up")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
