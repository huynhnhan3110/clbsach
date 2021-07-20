import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  Future<bool> loginWithEmail(String email, String password) async {
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
  Future<bool> logoutUser() async {
    bool retval = false;
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      _email = '';
      _uid = '';
      return true;
    }catch(e) {
      print(e);
    }
    return retval;
  }
  Future<bool> isLoggedIn() async {
    bool retval = false;
    try {
      User? _user = await _auth.currentUser;
      _email = _user!.email.toString();
      _uid = _user.uid;
      return true;
    }catch(e) {
      print(e);
    }
    return retval;
  }
  Future<bool> loginWithGoogle() async {
      bool retVal = false;
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      try {
        GoogleSignInAccount? _userGoogle = await _googleSignIn.signIn();
         GoogleSignInAuthentication _userGoogleAuth =  await _userGoogle!.authentication;
        final AuthCredential _usercredential = GoogleAuthProvider.credential(accessToken: _userGoogleAuth.accessToken, idToken: _userGoogleAuth.idToken);
        // ko co final thi se bi endless loading screen
        UserCredential _usercr = await _auth.signInWithCredential(_usercredential);
        if(_usercr.user != null) {
          _uid = _usercr.user!.uid;
          _email = _usercr.user!.email.toString();
          retVal = true;
        }
      }catch(e) {
        print('loi'+e.toString());
      }

      return retVal;
    }

}