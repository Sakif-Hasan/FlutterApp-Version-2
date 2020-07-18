import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Auth/register.dart';
import 'package:flutter_v2/screens/Services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // firebase var
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Register(),
    );
  }
}