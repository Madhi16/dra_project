


import 'dart:convert';

import 'package:dra_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/submittedlistform.dart';

class SubmitDetailsPage extends StatefulWidget {
  const SubmitDetailsPage({Key? key, required this.ids}) : super(key: key);

  final String ids;

  @override
  State<SubmitDetailsPage> createState() => _SubmitDetailsPageState();
}

class _SubmitDetailsPageState extends State<SubmitDetailsPage> {

 // late Future<List<AssessmentDetailsList>> futureData;
  late SharedPreferences localStorage;
  bool isLoading = false;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AssessmentDetailsList userObjcet;
  List<String> items = List.generate(10, (index) => 'Hello $index');
  fetchData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences.getInstance().then((token) async {
       var accessToken = token.getString("accessToken")!;


      final response = await get(
          Uri.parse('http://3.223.85.137/disaster_reconstruction/api/assessments/assessment_detail/${widget.ids}'),
       headers: {'Authorization': 'Bearer ${accessToken}'});
      if (response.statusCode == 200) {
        userObjcet =
            AssessmentDetailsList.fromJson((json.decode(response.body)['submittedlistform']));
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
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff16698C),
        leading: IconButton(onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                  accesstoken: '',
                )));} ,icon: Icon(Icons.arrow_back_ios)),
        title: Text("Submit Details"),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15),
                        child: Text('Roof Damage',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff16698C) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Eave Flashing',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Overhang at the side or ends ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: Text('Fascia Board',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                        child: Text('Wooden board behind the gutters damages ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Soffit & Type ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,bottom: 10),
                        child: Text('Lorem Ipsum & Fibre Cement',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Shingles & Type',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Sensitivity to touch & Architectural Shingles',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 10),
                        child: Text('Plywood',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Broken',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 10),
                        child: Text('Ice & Water Shield',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Vapor Barrier',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15),
                        child: Text('Windows',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff16698C) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Window Style',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Quantity',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Size',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Awning',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('4',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meters',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                      Divider(height: 5,color: Color(0xffF2F2F2),thickness: 2,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Window Style',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Quantity',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Size',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Slider',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('2',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meters',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                      Divider(height: 5,color: Color(0xffF2F2F2),thickness: 2,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Window Style',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Quantity',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Size',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Push Up',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('5',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meters',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15),
                        child: Text('Doors',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff16698C) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Door Style',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Quantity',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Size',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('LH-IN',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('2',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meters',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                      Divider(height: 5,color: Color(0xffF2F2F2),thickness: 2,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Door Style',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Quantity',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Size',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('LH-Out',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('1',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meters',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                      Divider(height: 5,color: Color(0xffF2F2F2),thickness: 2,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Door Style',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Quantity',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Size',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 30),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('RH-In',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('1',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meters',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15),
                        child: Text('Electrical',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff16698C) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Service Entrance',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Need Repair',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: Text('Service Pole',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                        child: Text('Needs Replacement',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Meter Can Size',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Meter Switch Size',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('12',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                            Text('4',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Interior Flooding',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Flooding Height',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 70),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Yes',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                            Text('20 meter',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left:15,right: 15,top: 10),
                child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15),
                        child: Text('Grounding System',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff16698C) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Ground Rod',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Needs Relacement',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15),
                        child: Text('Ground Clamp',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                        child: Text('Needs Relacement',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Ground Wire',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                        child: Text('Needs Relacement',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Card(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10,left: 15),
                        child: Text('Plumbing',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff16698C) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15),
                        child: Text('Water Supply',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Need Repair',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 10),
                        child: Text('Water Closet(Toilet only)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Need Relacement',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff131313) ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1/2"Service Pipe',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Length of damage',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 100),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Needs Repair',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('12 meter',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('3/4"Service Pipe',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Length of damage',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,right: 100,left: 15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Needs Repair',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('10 meter',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 15,right: 70,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1"Service Pipe',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                            Text('Length of damage',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff808B9E) ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,left:15,right: 100),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Needs Repair',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                            Text('8 meter',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, fontFamily: 'San Francisco',color:Color(0xff000000) ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}