import 'package:clb_sach/screens/login/localWidget/loginform.dart';
import 'package:clb_sach/states/currentuser.dart';
import 'package:clb_sach/widgets/ourContainer.dart';
import 'package:clb_sach/widgets/ourDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController _username = new TextEditingController();

  TextEditingController _email = new TextEditingController();

  TextEditingController _password = new TextEditingController();

  TextEditingController _repassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Sign up",
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _username,
          decoration: InputDecoration(
            hintText: "User name",
            prefixIcon: Icon(Icons.account_box_outlined),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _email,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock_outline),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _repassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Confirm Password",
            prefixIcon: Icon(Icons.lock_open_outlined),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        // ElevatedButton (
        //   onPressed: () {},
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal:110),
        //     child: Text("Sign up"),
        //   )
        // ),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            backgroundColor: Color(0xfff9bc0c),
            side: BorderSide(
              color: Colors.black87,
              width: 3,
            ),
            padding: EdgeInsets.only(top: 15, bottom: 0),
          ),
          onPressed: () {
            if (_email.text == '' || _password.text == '') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Password/Email not enter"),
                duration: Duration(seconds: 2),
              ));
            } else {
              if (_password.text == _repassword.text) {
                _signUp(_email.text, _password.text, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Password not match, try again"),
                  duration: Duration(seconds: 2),
                ));
              }
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 10.0, color: Color(0xffd1a832)),
              ),
            ),
            child: const Text('Sign up',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ));
  }

  void _signUp(String email, String password, BuildContext context) async {
    OurDialog.showLoadingDialog(context, 'Loading...');
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.signUp(email, password)) {
        OurDialog.hideLoadingDialog(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Signup successfully, please login"),
          duration: Duration(seconds: 4),
        ));
      }
    } catch (e) {
      print(e);
    }
  }
}
