import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Services/auth.dart';
import 'package:flutter_v2/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  //loading screen

  bool loading = false;

  // textfield values
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,

      // Title bar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        elevation: 0.5,
        title: Text('Sign In'),
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
                child: Text('Sign In',style: TextStyle(color: Colors.white),),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password) ;
                    if(result == null){
                    setState(() {
                      error = 'Sign In Error';
                      loading = false;
                    });
                    }
                  }
                },
              ),
              RaisedButton(
                color: Colors.teal,
                child: Text('Register',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  widget.toggleView();
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