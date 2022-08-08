import 'dart:convert';

import 'package:dra_project/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_page_api/api_login.dart';
import 'models/profilescreen_api.dart';

class profscreen extends StatefulWidget {
  const profscreen({Key? key}) : super(key: key);

  @override
  State<profscreen> createState() => _profscreenState1();
}

class _profscreenState1 extends State<profscreen> {

  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController emailaddresscontroller = TextEditingController();
  final TextEditingController mobilenumbercontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController selectstatecontroller = TextEditingController();
  final TextEditingController selectcitycontroller = TextEditingController();
  final TextEditingController zipcodecontroller = TextEditingController();
  bool isLoading = false;
  final ApiClient _apiClient = ApiClient();
  final _formKey = GlobalKey<FormState>();

  late UserProfile userObjcet;

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences.getInstance().then((token) async {
      var accessToken = token.getString("accessToken")!;
      final response = await post(
          Uri.parse('http://3.223.85.137/disaster_reconstruction/api/user'),
          headers: {'Authorization': 'Bearer ${accessToken}'});
      if (response.statusCode == 200) {
        userObjcet =
            UserProfile.fromJson((json.decode(response.body)['userProfile']));

        firstnamecontroller.text = userObjcet.firstName.toString();
        lastnamecontroller.text = userObjcet.lastName.toString();
        emailaddresscontroller.text = userObjcet.email.toString();
        mobilenumbercontroller.text = userObjcet.mobileNo.toString();
        addresscontroller.text = userObjcet.address.toString();
        selectcitycontroller.text = userObjcet.city.toString();
        selectstatecontroller.text = userObjcet.state.toString();
        zipcodecontroller.text = userObjcet.pincode.toString();



        print(userObjcet.toJson());
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Unexpected error occured!');
      }
    });
  }



  @override
  void initState() {
    // TODO: implement initState

    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Edit Profile',style: TextStyle(color: Colors.white,fontFamily: 'San Francisco',fontSize: 14),),
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
          }, icon: Icon(Icons.arrow_back_rounded)),
          actions: [
          ],
          backgroundColor: Color(0xff16698C),),
        body: isLoading == true  ? Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset('assets/images/img_2.png'),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: firstnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: lastnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: emailaddresscontroller,
                  decoration: InputDecoration(
                    hintText: 'E-mail Address',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: mobilenumbercontroller,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: selectstatecontroller,
                  decoration: InputDecoration(
                    hintText: 'Select State',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: selectcitycontroller,
                  decoration: InputDecoration(
                    hintText: 'Select City',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child: TextFormField(
                  controller: zipcodecontroller,
                  decoration: InputDecoration(
                    hintText: 'Zipcode',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                      height: 50,
                      width: 345,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff12AFC0),
                        ),
                        onPressed:() {
                          print("Abcd");
                          _updateDetail();
                        },
                        child: Text('UPDATE',style: TextStyle(fontFamily: 'San Francisco',fontSize: 12,fontWeight: FontWeight.w600),),
                      )
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

  void _updateDetail() async {
    var email = emailaddresscontroller.text;
    var first_name = firstnamecontroller.text;
    var last_name = lastnamecontroller.text;
    var mobile_no = mobilenumbercontroller.text;
    var address = addresscontroller.text;
    var state = selectstatecontroller.text;
    var city = selectcitycontroller.text;
    var pincode = zipcodecontroller.text;


    final mobileRemove = mobile_no.replaceAll(RegExp('-'), ''); // abc

    print("svdvdavdavdasv $mobileRemove");

    var accessToken = '';
    await SharedPreferences.getInstance().then((token) {
      accessToken = token.getString("accessToken")!;
      email = token.getString("email")!;
      print("email${token.getString("email")}");
      // fetchData(accessToken);

    });
    dynamic res = await _apiClient.editProfile(
      email,
      accessToken,
      first_name,
      last_name,
      mobileRemove,
      address,
      state,
      city,
      pincode,
    );
    setState(() {
      isLoading = false;
    });
    if (res?.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(' Profile update successfully'),
        backgroundColor: Colors.green.shade300,

      ));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => profile()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res.data['error']),
        backgroundColor: Colors.red.shade300,
      ),
      );
    }
  }
}

