import 'package:flutter/material.dart';
import './token.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool invalid = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordConttoller.dispose();
    super.dispose();
  }

  final usernameController = TextEditingController();
  final passwordConttoller = TextEditingController();

  String token;

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/goldenBall.png', fit: BoxFit.scaleDown),
            ],
          ),
          SizedBox(height: 50.0),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              filled: true,
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: passwordConttoller,
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
            ),
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('NEXT'),
                onPressed: () {
                  setState(() {
                    username = usernameController.text;
                    password = passwordConttoller.text;
                    authenticate(username, password).then((result) {
                      token = result.token;
                      if (token == "invalid") {
                        invalid = true;
                      } else if (token != null) {
                        print("loged in");
                        invalid = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                      } else {
                        print("something went wrong");
                      }
                    });
                  });
                },
              )
            ],
          ),
          SizedBox(height: 20.0),
          invalid ? Text("Invalid Username or Password") : Text(""),
        ],
      )),
    );
  }
}
