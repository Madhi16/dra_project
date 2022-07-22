import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../api_login/api_login.dart';
import '../screens.dart';
import 'Forgot Password/Forgot Password.dart';

class HomeState extends StatefulWidget {
   HomeState({Key ?key, required String accesstoken}) : super(key: key);

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
 // bool _showPassword = false;

   login(String email,String password) async {
     setState(() {
       isLoading = true;
     });
    if (_formKey.currentState!.validate()) {
      dynamic res = await _apiClient.login(
        email,
        password,
      );
      setState(() {
        isLoading = false;
      });
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(accesstoken: '')));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res?.statusCode==200??false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('successfully login'),
          backgroundColor: Colors.green.shade300,

        ));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(accesstoken: '')));

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Enter valid user name or password"),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
    else
      {
        setState(() {
          isLoading = false;
        });
      }
  }
  String _userName = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 102.37, left: 84, right: 83.2),
                    child:
                      Image.asset("assets/images/Logo.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 33.5, top: 25, bottom: 20),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20,fontFamily: 'San Francisco',fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 34, right: 34, bottom: 15),
                      child: TextFormField(
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter user name',
                          prefixIcon: Image.asset('assets/images/icon.png'),
                          hintStyle:
                              TextStyle(color: Color(0xff808B9E), fontSize: 12,fontFamily: 'San Francisco',fontWeight: FontWeight.w500),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Color(0xff808B9E))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xff808B9E)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 4) {
                            return 'Username must be at least 4 characters in length';
                          }
                          if (value.trim().length > 256) {
                            return 'Username must be at not more than 256 characters in length';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 34, right: 34, bottom: 11.56),
                      child: TextFormField(
                         controller: passwordController,
                        obscureText: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Password',
                          prefixIcon: Image.asset('assets/images/icon1.png'),
                          hintStyle:
                              TextStyle(color: Color(0xff808B9E), fontSize: 12,fontFamily: 'San Francisco',fontWeight: FontWeight.w500),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Color(0xff808B9E))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xff808B9E)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: TextButton(
                            child: const Text(
                              'Forget Password?',
                              style: TextStyle(
                                  fontSize: 12,fontFamily: 'San Francisco',fontWeight: FontWeight.w600, color: Color(0xff12AFC0)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondRoute()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 33.5, right: 34),
                          child: Container(
                              height: 45,
                              width: 307,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff12AFC0),
                                ),
                                onPressed:() async {


                                { login(emailController.text,passwordController.text);}},
                                child:(isLoading)
                                    ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 1.5,
                                    ))
                                    : Text('Login',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'San Francisco'),),
                              )),
                        ),
                      ],
                    )
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
