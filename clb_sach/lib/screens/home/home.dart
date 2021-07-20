import 'package:clb_sach/screens/root/root.dart';
import 'package:clb_sach/states/currentuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen"),),
      body: Center(
        child: TextButton(
          child: Text("Sign Out"),
          onPressed: () async{
            CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
            if(await _currentUser.logoutUser()) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OurRoot(),), (route) => false);
            }

          },
        ),
      )
    );
  }
}