import 'package:dra_project/login_ui/login_page.dart';
import 'package:flutter/material.dart';
import 'screens.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeState(accesstoken: '',),
      debugShowCheckedModeBanner: false,
    );
  }
}

