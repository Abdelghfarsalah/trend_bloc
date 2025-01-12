import 'package:flutter/material.dart';

class BodyPost extends StatelessWidget {
  const BodyPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/aziz.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
