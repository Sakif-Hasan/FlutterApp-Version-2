import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_v2/models/user.dart';


class Auth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser

  User _userFirebaseUser(FirebaseUser user){

    return user != null ? User(uid: user.uid) : null;

  }

  // user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in with email

   Future signInWithEmailAndPassword(String email,String password) async {

    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register user with email and password

  Future registerWithEmailAndPassword(String email,String password) async {

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out 
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}