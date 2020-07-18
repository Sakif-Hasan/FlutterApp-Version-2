import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Services/auth.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  // textfield values
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Title bar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        elevation: 0.5,
        title: Text('Register'),
      ),

      // Body of the App
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText:'Enter your email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText:'Enter your password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a valid password ( six digits )' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueAccent[400],
                child: Text('Sign Up',style: TextStyle(color: Colors.white),),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() => error = 'Something went wrong');
                    }
                  }
                },
              ),
              RaisedButton(
                color: Colors.teal,
                child: Text('Sign in',style: TextStyle(color: Colors.white),),
                onPressed: () async{
                  print('okay');
                } ,
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          )
        ),
      ),
    );
  }
}