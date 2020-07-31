import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_v2/models/user.dart';

class DatabaseService {


  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String location) async{
    return await userCollection.document(uid).setData({

      'name' : name,
      'location' : location,

    });
  }

  //user request
  final CollectionReference userRequestCollection = Firestore.instance.collection('userRequest');

  Future updateUserRequest(String name, String phoneNumber, String bloodType, String hospital, String location) async{
    return await userRequestCollection.document(uid).setData({
      'name': name,
      'phoneNumber': phoneNumber,
      'bloodType': bloodType,
      'hospital': hospital,
      'location': location,
    });
  }

  // get user stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

  getData() async { 
    return await Firestore.instance.collection('requests').getDocuments(); 
  }
}