import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_submission_pemula/main_page.dart';
import 'package:flutter_submission_pemula/util/constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool passwordInvisble;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordInvisble = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(mPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/flutter.png"),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    labelText: "Username",
                    hintText: "Username",
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: passwordInvisble,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordInvisble
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(
                          () {
                            passwordInvisble = !passwordInvisble;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                            name: _nameController.text,
                          ),
                        ));
                  },
                  elevation: 0,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
