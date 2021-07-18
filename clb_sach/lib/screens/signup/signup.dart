import 'package:clb_sach/screens/signup/localWidget/signupform.dart';
import 'package:flutter/material.dart';

class OurSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [Padding(padding: const EdgeInsets.only(top: 20),child: BackButton(),),],),
              SizedBox(height: 80,),
              SignupForm(),
            ],
          ),
          ),
        ],
      ),
    );
  }
}