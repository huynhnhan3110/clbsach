import 'package:clb_sach/screens/home/home.dart';
import 'package:clb_sach/screens/signup/signup.dart';
import 'package:clb_sach/states/currentuser.dart';
import 'package:clb_sach/widgets/ourContainer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clb_sach/widgets/ourDialog.dart';
enum LoginType {
  google,email
}
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _email = new TextEditingController();

  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return OurContainer(
      child: Column(
        children: [
          Text("Login", style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          TextField(controller: _email,decoration: InputDecoration(hintText: "Email",prefixIcon: Icon(Icons.email_outlined),),),
          SizedBox(height: 20,),

          TextField(controller: _password,obscureText: true,decoration: InputDecoration(hintText: "Password",prefixIcon: Icon(Icons.lock_outline),),),
          SizedBox(height: 20,),

          // ElevatedButton (
          //   onPressed: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal:110),
          //     child: Text("Login"),
          //   )
          // ),
          TextButton(
                  style: TextButton.styleFrom(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: Color(0xfff9bc0c),
                    side: BorderSide(
                      color: Colors.black87,
                      width: 3,
                    ),
                    padding: EdgeInsets.only(top: 15, bottom: 0),
                  ),
                  onPressed: () {
                    if(_email.text == '' || _password.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password/Email not enter"),duration: Duration(seconds: 2),));
                    } else {
                      _login(logintype: LoginType.email, email:_email.text,password: _password.text,context: context);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 10.0, color: Color(0xffd1a832)),
                      ),
                    ),
                    child: const Text('Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                ),
          SizedBox(height: 20,),
          TextButton(
                  style: TextButton.styleFrom(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.black87,
                      width: 3,
                    ),
                    padding: EdgeInsets.only(top: 15, bottom: 0),
                  ),
                  onPressed: () {
                    _login(logintype: LoginType.google, context: context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 10.0, color: Color(0xffd1a832)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image(image: AssetImage("assets/google_logo.png"),height: 25.0,),
                      Padding(padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Sign in with Google',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center),
                      )
                    ],)
                  ),
                ),
          SizedBox(height: 25,),
          RichText(
            text: TextSpan(
              text: "New user? ",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 16,),
              children: [
                TextSpan(recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OurSignup(),),);
                }, text: "Signup for new account",style: TextStyle(decoration: TextDecoration.underline,color: Theme.of(context).primaryColorLight,fontSize: 16,),),
              ]
            ),
          )
        ],
      )
    );
  }

  void _login({required LoginType logintype,String? email, String? password, required BuildContext context}) async {
    OurDialog.showLoadingDialog(context, 'Loading...');
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String result = "fail";
    switch(logintype) {
      case LoginType.google:
        if(await _currentUser.loginWithGoogle()) {
           result = "success";
        }
        break;
      case LoginType.email:
        if(await _currentUser.loginWithEmail(email!, password!)) {
          result = "success";
        }
        break;
        default:
    }
    
    if(result == "success") {
      OurDialog.hideLoadingDialog(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen(),)
      );
    } else {
      OurDialog.hideLoadingDialog(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password/Email incorrect"),duration: Duration(seconds: 2),));
    }
  }
}