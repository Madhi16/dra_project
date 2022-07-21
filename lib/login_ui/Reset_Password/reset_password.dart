import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../api_login/api_login.dart';
import '../Forgot Password/splash_screen.dart';
import '../Verification_Code/verification_code.dart';
import '../login_page.dart';

class reset_password extends StatefulWidget {
  @override
  _reset_password createState() => _reset_password();
}

class _reset_password extends State<reset_password> {
  bool hidePassword = true;
  bool hidePassword1 = false;
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  var confirmPass;
  ResetPassword(String email,String password) async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      dynamic res = await _apiClient.ResetPassword(
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
                builder: (context) => HomeState(accesstoken: '')));

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something went wrong"),
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

  @override
  void _trySubmitForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid == true) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  PinCodeVerificationScreen(email: '',)),
                );
              },color: Color(0xff98a1b0),),
              Text('Back',style: TextStyle(color: Color(0xff98a1b0),fontFamily: 'San Francisco',fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150,bottom: 15,right: 30,left: 10),
                    child: Center(
                      child: Column(
                        children: [
                          Text("Reset password",style: TextStyle(fontSize: 40,fontFamily: 'San Francisco',fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( right: 25,left: 30,bottom: 30),
                    child: Text(
                      "Enter your new password",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:25,right: 25),
                    child: TextFormField(
                      controller: emailController,
                      obscureText: hidePassword,//show/hide password
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        prefixIcon: Image.asset('assets/images/icon1.png'),
                        suffixIcon: IconButton(
                          icon: hidePassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),//circular border for TextField.
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return "Please Re-Enter New Password";
                        }
                        else if (value.trim().length < 8) {
                          return "Password must be atleast 8 characters long";
                        }
                        return null;
                      },
                      onChanged: (value) =>
                      _userName = value,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:25,right: 25 ),
                        child: TextFormField(
                          controller: passwordController,
                          onChanged: (value) {
                            print(value);
                          },
                          obscureText: hidePassword1,//show/hide password
                          decoration: InputDecoration(
                            hintText: 'Confirm  Password',
                            prefixIcon: Image.asset('assets/images/icon1.png'),
                            suffixIcon: IconButton(
                              icon: hidePassword1
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  hidePassword1 = !hidePassword1;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),//circular border for TextField.
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value
                                    .trim()
                                    .isEmpty) {
                              return "Please Re-Enter New Password";
                            }
                            else if (value
                                .trim()
                                .length < 8) {
                              return "Password must be atleast 8 characters long";
                            } else if (value != _userName) {
                              return "Password must be same as above";
                              return null;
                            };
                          }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: 345,
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff12AFC0),
                                  ),
                                  onPressed:() {ResetPassword(emailController.text,passwordController.text);},
                                  child: Text('CONFIRM',style: TextStyle(fontFamily: 'San Francisco',fontSize: 12,fontWeight: FontWeight.w600),),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}