import 'package:flutter/material.dart';

class OurDialog {
  static void showLoadingDialog(BuildContext context, String content) {
    showDialog(barrierDismissible: false,context: context, builder: (context) {
      return Dialog(
        child: Container(
          height: 150,
          color: Color(0xff90caf9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10,),
              Text(content, style: TextStyle(fontSize: 20,color: Theme.of(context).secondaryHeaderColor),),
            ],
          ),
        ),
      );
    },);
  }
  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(OurDialog);
  }
}