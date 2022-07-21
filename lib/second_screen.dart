import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Text(
            'It is a second layout tab, which is responsible for taking pictures from your mobile.',
            style: TextStyle(fontSize: 35.0),
          ),
        ));
  }
}
