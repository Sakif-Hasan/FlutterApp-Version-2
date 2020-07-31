import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_v2/screens/Services/database.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  //final db = Firestore.instance;
  QuerySnapshot request;
  DatabaseService dbService = new DatabaseService();

  @override
  void initState() {
    dbService.getData().then((results){
      setState(() {
        request = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: request.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
        return new ListTile(
          title: Text(request.documents[i].data['authorFirstName']),
          subtitle: Text(request.documents[i].data['bloodType']),
        );
      },
      ),
    );
  }
}