import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String storedEmail = "user@gmail.com";
  final String storedPassword = "123";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    String enteredEmail = emailController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (enteredEmail == storedEmail && enteredPassword == storedPassword) {
      // Navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    } else {
      // Show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid credentials."),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Messenger Clone Login"),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                controller: emailController,
                placeholder: "Email",
                padding: EdgeInsets.all(10),
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                controller: passwordController,
                placeholder: "Password",
                obscureText: true,
                padding: EdgeInsets.all(10),
              ),
              SizedBox(height: 20),
              CupertinoButton.filled(
                child: Text("Login"),
                onPressed: login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
