import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier{
  late String _uid;
  late String _email;
  
  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUp(String email, String password) async{
    bool retVal = false;
    try {
      UserCredential _usercredential =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_usercredential.user != null) {
        retVal = true;
      }
    }catch(e) {
      print(e);
    }
    return retVal;
  }
  Future<bool> login(String email, String password) async {
    bool retVal = false;
     try {
      UserCredential _usercredential =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(_usercredential.user != null) {
        _uid = _usercredential.user!.uid;
        _email = _usercredential.user!.email.toString();
        retVal = true;
      }
    }catch(e) {
      print(e);
    }

    return retVal;
  }

}