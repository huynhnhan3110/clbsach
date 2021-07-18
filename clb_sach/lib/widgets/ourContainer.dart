import 'package:flutter/material.dart';

class OurContainer extends StatelessWidget {
  final Widget child;

  const OurContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(4,4),
          )
        ]
      ),
    );
  }
}