import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Home/map.dart';
import 'package:flutter_v2/screens/Services/database.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {

  final db = Firestore.instance;

  String name;
  String phoneNumber;
  String bloodType;
  String hospital;
  String location;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value){
        if(value.isEmpty){
          return "Fill The Form";
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget _buildPhoneNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      validator: (String value){
        if(value.isEmpty){
          return "Fill The Form";
        }
      },
      onSaved: (String value) {
        phoneNumber = value;
      },
    );
  }

  Widget _buildBloodType(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Blood Type'),
      validator: (String value){
        if(value.isEmpty){
          return "Fill The Form";
        }
      },
      onSaved: (String value) {
        bloodType = value;
      },
    );
  }

  Widget _buildHospital(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Hospital'),
      validator: (String value){
        if(value.isEmpty){
          return "Fill The Form";
        }
      },
      onSaved: (String value) {
        hospital = value;
      },
    );
  }

  Widget _buildLocation(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Location'),
      validator: (String value){
        if(value.isEmpty){
          return "Fill The Form";
        }
      },
      onSaved: (String value) {
        location = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make a request"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form( 
          key: _formKey,
          child: Column(
          children: <Widget>[
            _buildName(),
            _buildPhoneNumber(),
            _buildBloodType(),
            _buildHospital(),
            _buildLocation(),
            SizedBox(height: 100),
            RaisedButton(
              child: Text('Submit', style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),),
              onPressed: () async {
                _formKey.currentState.save();
                await db.collection("userRequest").add({
                  'name': name,
                  'phoneNumber': phoneNumber,
                  'bloodType': bloodType,
                  'hospital': hospital,
                  'location': location,
                });

                Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
              },
            )
          ],),
        ),
      ),
    );
  }
}