import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Services/auth.dart';
import 'package:flutter_v2/screens/wrapper.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()));
            }, 
            icon: Icon(Icons.exit_to_app), 
            label: Text('Logout'),
          )
        ],
      ),
    );
  }
}