import 'package:dio/dio.dart';
import 'package:dra_project/login_ui/Forgot%20Password/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../api_login/api_login.dart';
import '../Verification_Code/verification_code.dart';
import '../login_page.dart';

class SecondRoute extends StatefulWidget {

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}
class _SecondRouteState extends State<SecondRoute> {
  bool isLoading = false;
  final TextEditingController userEmail = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  ForgotPassword(String email,) async {
    isLoading = true;

    if (_formKey.currentState!.validate()) {
      Response res = await _apiClient.ForgotPassword(
        email,
      );
      print(res.statusCode);
      setState(() {
        isLoading = false;
      });
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(accesstoken: '')));
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res.statusCode==200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('successfully login'),
          backgroundColor: Colors.green.shade300,

        ));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PinCodeVerificationScreen(email: userEmail.text,)));

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:  Text(res.data['error']),
          backgroundColor: Colors.red.shade300,

        ),
        );
      }
    }
    else
    {
      setState(() {
        isLoading = false;
      });
    }
  }
  final _formKey = GlobalKey<FormState>();
  // void _trySubmitForm() {
  //   final bool isValid = _formKey.currentState!.validate();
  //   if (isValid == true) {
  //     {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => PinCodeVerificationScreen(email: userEmail.text,)),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
       appBar: AppBar(backgroundColor: Colors.white,
         automaticallyImplyLeading: false,
         elevation: 0,
         title: Row(
           children: [
             IconButton(icon: Icon(Icons.arrow_back_ios_rounded),onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) =>  Myapp()),
               );
             },color: Color(0xff98a1b0),),
             Text('Back',style: TextStyle(color: Color(0xff98a1b0),fontFamily: 'San Francisco',fontWeight: FontWeight.w500),),
           ],
         ),
       ),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 45 ),
              child: Text(
                "Forget Password",
                style: TextStyle(fontSize: 35,color: Color(0xff000000),fontFamily: 'San Francisco',fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:25,left: 34, right: 40),
              child: Text(
                "Please enter registered email address and we`ll send you instruction",
                style: TextStyle(fontSize: 17,color: Color(0xff000000),fontFamily: 'San Francisco',),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:50,right: 34,left: 34),
              child: TextFormField(
                controller: userEmail,

                autocorrect: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email Address',
                  prefixIcon: Image.asset('assets/images/mail.png',color:Color(0xff808B9E),),
                  hintStyle: TextStyle(color: Color(0xff808B9E),fontSize: 12,fontFamily: 'San Francisco',fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Color(0xff808B9E))),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Color(0xff808B9E)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter email ';
                  }
                  if (RegExp(r"\s+\b|\b\s").hasMatch(value)) {
                    return 'Blank Space';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'^.+@[^]+\.[^]+$').hasMatch(value)) {
                    return 'Please enter valid email';
                  }
                },
                // onChanged: (value) => userEmail = value,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 34,right: 34),
                  child: Container(
                      height: 50,
                      width: 335,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff12AFC0),
                        ),
                        onPressed: ()async {
                        {
                          ForgotPassword(userEmail.text,);}
                        },
                        child:(isLoading)
                            ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            )): Text('CONFIRM',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600)),
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
