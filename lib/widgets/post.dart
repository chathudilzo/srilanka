import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Post extends StatelessWidget {
  const Post({super.key,required this.screenSize});
  final screenSize;

  @override
  Widget build(BuildContext context) {
    return screenSize.width<800? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width,
        height: screenSize.height*0.50,
        color: Colors.red,
      ),
    ):Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width*0.25,
        height: screenSize.width*0.25,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}