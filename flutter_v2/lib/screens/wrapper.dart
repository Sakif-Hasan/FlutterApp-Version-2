import 'package:flutter/material.dart';
import 'package:flutter_v2/models/user.dart';
import 'package:flutter_v2/screens/Auth/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_v2/screens/Home/map.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // Either home or login depending on sign in status
    if(user == null){
      return Authenticate();
    }else{
      return Map();
    }
  }
}