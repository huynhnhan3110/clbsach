import 'package:clb_sach/screens/login/localWidget/loginform.dart';
import 'package:flutter/material.dart';

class OurLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset('logo-transparent.png'),
                ),
                SizedBox(
                  height: 0,
                ),
                LoginForm(),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
