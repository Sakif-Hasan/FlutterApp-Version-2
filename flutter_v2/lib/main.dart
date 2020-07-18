import 'package:flutter/material.dart';
import 'package:flutter_v2/models/user.dart';
import 'package:flutter_v2/screens/Services/auth.dart';
import 'package:flutter_v2/screens/wrapper.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: Auth().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}