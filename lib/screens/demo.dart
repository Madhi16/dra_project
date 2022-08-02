// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'models/login_page_api/api_login.dart';
//
// class Welcome {
//   Welcome({
//     required this.type,
//     required this.label,
//     required this.id,
//     required this.validation,
//     required this.data,
//   });
//
//   String type;
//   String label;
//   String id;
//   int validation;
//   List<String> data;
//
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//     type: json["type"],
//     label: json["label"],
//     id: json["id"],
//     validation: json["validation"],
//     data: json.containsKey("data")
//         ? List<String>.from(json["data"]?.map((x) => x))
//         : [],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "label": label,
//     "id": id,
//     "validation": validation,
//     "data": List<dynamic>.from(data.map((x) => x)),
//   };
// }
//
// Future<List<Welcome>> fetchData() async {
//   final response = await http.get(Uri.parse(('http://3.223.85.137/disaster_reconstruction/api/assessments/store/1')));
//   if (response.statusCode == 200) {
//     var listItemsData = (json.decode(response.body) as List)
//         .map((item) => Welcome.fromJson(item))
//         .toList();
//     return listItemsData;
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
// }
//
//
// class Damages extends StatefulWidget {
//   Damages({Key? key}) : super(key: key);
//
//   @override
//   _DamagesState createState() => _DamagesState();
// }
//
// class _DamagesState extends State<Damages> {
//   late SharedPreferences localStorage;
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   final ApiClient _apiClient = ApiClient();
//   bool valuefirst = false;
//   bool valuesecond = false;
//   bool value3 = false;
//   bool value4 = false;
//   bool value5 = false;
//   bool value6 = false;
//   bool value7 = false;
//   bool value8 = false;
//   bool value9 = false;
//   bool value10 = false;
//   bool value11 = false;
//   bool value12 = false;
//   bool value13 = false;
//   bool value14 = false;
//   bool value15 = false;
//   bool value16 = false;
//   bool value17 = false;
//
//   String? gender;
//   final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
//   int _radioValue = 0;
//
//   void _handleRadioValueChange(value) {
//     setState(() {
//       _radioValue = value;
//
//       switch (_radioValue) {
//         case 0:
//           break;
//         case 1:
//           break;
//       }
//     });
//   }
//
//   late Future<List<Welcome>> futureData;
//   late String _selectedUser;
//   String _userName = '';
//
//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchData();
//   }
//
//   @override
//   void _trySubmitForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid == true) {
//     }
//   }
//   Assessment(String accessToken) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     if (_formKey.currentState!.validate()) {
//       dynamic res = await _apiClient.assessment(
//         accessToken,
//       );
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       if (res?.statusCode==200??false) {
//         save(res['accessToken']);
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: const Text('successfully login'),
//           backgroundColor: Colors.green.shade300,
//
//         ));
//         // Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //         builder: (context) => AssesmentPage()));
//
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content:  Text(res.data['error']),
//           backgroundColor: Colors.red.shade300,
//         ),
//         );
//       }
//     }
//     else
//     {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: FutureBuilder<List<Welcome>>(
//           future: futureData,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//
//               List<Welcome>? data = snapshot.data;
//               return ListView.builder(
//                   itemCount: data!.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                         height: 170,
//                         width: 100,
//                         color: Colors.white,
//                         child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   data[index].label,
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Eave Flashing',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Fascia Board',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Soffit',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Soffit Type',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 35),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius
//                                             .circular(15.0),
//                                         border: Border.all(
//                                           color: Colors.black,
//                                           style: BorderStyle.solid,
//                                         ),
//                                       ),
//                                       child: DropdownButton(
//                                         items: _dropdownValues
//                                             .map((value) =>
//                                             DropdownMenuItem(
//                                               child: Text(value),
//                                               value: value,
//                                             ))
//                                             .toList(),
//                                         onChanged: (String? value) {},
//                                         isExpanded: false,
//                                         value: _dropdownValues.first,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Shingles',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Shingle Style',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 35),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius
//                                             .circular(15.0),
//                                         border: Border.all(
//                                           color: Colors.black,
//                                           style: BorderStyle.solid,
//                                         ),
//                                       ),
//                                       child: DropdownButton(
//                                         items: _dropdownValues
//                                             .map((value) =>
//                                             DropdownMenuItem(
//                                               child: Text(value),
//                                               value: value,
//                                             ))
//                                             .toList(),
//                                         onChanged: (String? value) {},
//                                         isExpanded: false,
//                                         value: _dropdownValues.first,
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Plywood',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Ice & Water Shield',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Torch On',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Tough Guard',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(
//                                                 0xffF2F2F2), width: 344)),
//                                   ),
//                                 ),
//                               ),
//
//
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment
//                                     .start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(16.0),
//                                     child: Text(
//                                       'Roof Damage',
//                                       style: TextStyle(
//                                           color: Color(0xff16698C),
//                                           fontFamily: 'San Francisco',
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 16.0, bottom: 10),
//                                     child: Text(
//                                       'Window Style',
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: Color(0xff707070),
//                                           fontFamily: 'San Francisco'),
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child:
//                                             Checkbox(
//                                               value: this.valuefirst,
//                                               onChanged: (bool? value) {
//                                                 setState(() {
//                                                   this.valuefirst =
//                                                   value!;
//                                                 });
//                                               },
//                                             ),), Expanded(child: Text(
//                                             'Awining',
//                                             style: TextStyle(
//                                                 fontSize: 12.0),
//                                           ),),
//
//
//                                           Expanded(
//                                             child: Checkbox(
//                                               value: this.valuesecond,
//                                               onChanged: (bool? value) {
//                                                 setState(() {
//                                                   this.valuesecond =
//                                                   value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Slider',
//                                               style: TextStyle(
//                                                   fontSize: 12.0),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Checkbox(
//                                               value: this.value3,
//                                               onChanged: (bool? value) {
//                                                 setState(() {
//                                                   this.value3 = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Colonial',
//                                               style: TextStyle(
//                                                   fontSize: 12.0),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Checkbox(
//                                               value: this.value4,
//                                               onChanged: (bool? value) {
//                                                 setState(() {
//                                                   this.value4 = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Text(
//                                               'Push up',
//                                               style: TextStyle(
//                                                   fontSize: 12.0),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 35),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius
//                                             .circular(15.0),
//                                         border: Border.all(
//                                           color: Colors.black,
//                                           style: BorderStyle.solid,
//                                         ),
//                                       ),
//                                       child: DropdownButton(
//                                         items: _dropdownValues
//                                             .map((value) =>
//                                             DropdownMenuItem(
//                                               child: Text(value),
//                                               value: value,
//                                             ))
//                                             .toList(),
//                                         onChanged: (String? value) {},
//                                         isExpanded: false,
//                                         value: _dropdownValues.first,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 20),
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 35),
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   15.0),
//                                               border: Border.all(
//                                                 color: Colors.black,
//                                                 style: BorderStyle.solid,
//                                               ),
//                                             ),
//                                             child: DropdownButton(
//                                               items: _dropdownValues
//                                                   .map((value) =>
//                                                   DropdownMenuItem(
//                                                     child: Text(value),
//                                                     value: value,
//                                                   ))
//                                                   .toList(),
//                                               onChanged: (
//                                                   String? value) {},
//                                               isExpanded: false,
//                                               value: _dropdownValues
//                                                   .first,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment
//                                       .start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(16.0),
//                                       child: Text(
//                                         'Doors',
//                                         style: TextStyle(
//                                             color: Color(0xff16698C),
//                                             fontFamily: 'San Francisco',
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: 14),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 16.0, bottom: 10),
//                                       child: Text(
//                                         'Door Style',
//                                         style: TextStyle(
//                                             fontSize: 14,
//                                             color: Color(0xff707070),
//                                             fontFamily: 'San Francisco'),
//                                       ),
//                                     ),
//                                     Column(
//                                       children: [
//                                         Row(
//                                           children: <Widget>[
//                                             Expanded(
//                                               child: Checkbox(
//                                                 value: this.value5,
//                                                 onChanged: (bool? value) {
//                                                   setState(() {
//                                                     this.value5 = value!;
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Text(
//                                                 'LH-IN',
//                                                 style: TextStyle(
//                                                     fontSize: 12.0),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Checkbox(
//                                                 value: this.value6,
//                                                 onChanged: (bool? value) {
//                                                   setState(() {
//                                                     this.value6 = value!;
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Text(
//                                                 'LH-OUT',
//                                                 style: TextStyle(
//                                                     fontSize: 12.0),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Checkbox(
//                                                 value: this.value7,
//                                                 onChanged: (bool? value) {
//                                                   setState(() {
//                                                     this.value7 = value!;
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Text(
//                                                 'RH-IN',
//                                                 style: TextStyle(
//                                                     fontSize: 12.0),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Checkbox(
//                                                 value: this.value8,
//                                                 onChanged: (bool? value) {
//                                                   setState(() {
//                                                     this.value8 = value!;
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Text(
//                                                 'RH-OUT',
//                                                 style: TextStyle(
//                                                     fontSize: 12.0),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 20),
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 35),
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius
//                                                   .circular(
//                                                   15.0),
//                                               border: Border.all(
//                                                 color: Colors.black,
//                                                 style: BorderStyle.solid,
//                                                 width: 1,
//                                               ),
//                                             ),
//                                             child: DropdownButton(
//                                               items: _dropdownValues
//                                                   .map((value) =>
//                                                   DropdownMenuItem(
//                                                     child: Text(value),
//                                                     value: value,
//                                                   ))
//                                                   .toList(),
//                                               onChanged: (
//                                                   String? value) {},
//                                               isExpanded: false,
//                                               value: _dropdownValues
//                                                   .first,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets
//                                                 .only(left: 20),
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets
//                                                       .symmetric(
//                                                       horizontal: 35),
//                                                   decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius
//                                                         .circular(15.0),
//                                                     border: Border.all(
//                                                       color: Colors.black,
//                                                       style: BorderStyle
//                                                           .solid,
//                                                       width: 1,
//                                                     ),
//                                                   ),
//                                                   child: DropdownButton(
//                                                     items: _dropdownValues
//                                                         .map((value) =>
//                                                         DropdownMenuItem(
//                                                           child: Text(
//                                                               value),
//                                                           value: value,
//                                                         ))
//                                                         .toList(),
//                                                     onChanged: (
//                                                         String? value) {},
//                                                     isExpanded: false,
//                                                     value: _dropdownValues
//                                                         .first,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Electrical',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 16.0, bottom: 10),
//                                 child: Text(
//                                   'Service Entrance',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: Color(0xff707070),
//                                       fontFamily: 'San Francisco'),
//                                 ),
//                               ),
//                               Row(
//
//                                 children: [
//                                   Expanded(
//                                     child: Checkbox(
//                                       value: this.value9,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value9 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'Needs Repair',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Checkbox(
//                                       value: this.value10,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value10 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'Needs Replacement',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 16.0, bottom: 10),
//                                 child: Text(
//                                   'Service Pole',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: Color(0xff707070),
//                                       fontFamily: 'San Francisco'),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Checkbox(
//                                       value: this.value11,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value11 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'Needs Repair',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Checkbox(
//                                       value: this.value12,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value12 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'Needs Replacement',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: ListTile(
//                                       title: TextFormField(
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius
//                                                   .all(
//                                                   Radius.circular(8))),
//                                           hintText: '  Meter Can Size',
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: ListTile(
//                                       title: TextFormField(
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius
//                                                   .all(
//                                                   Radius.circular(8))),
//                                           hintText: 'Meter Switch Size',
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 16.0, bottom: 10),
//                                 child: Text(
//                                   'Interior Flooding',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: Color(0xff707070),
//                                       fontFamily: 'San Francisco'),
//                                 ),
//                               ),
//                               Row(mainAxisAlignment: MainAxisAlignment
//                                   .start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 15),
//                                       child: new Row(
//                                           mainAxisAlignment: MainAxisAlignment
//                                               .start,
//                                           children: [
//                                             new Radio(
//                                               value: 0,
//                                               groupValue: _radioValue,
//                                               onChanged: _handleRadioValueChange,
//                                             ),
//                                             new Text(
//                                               'Yes',
//                                               style: new TextStyle(
//                                                   fontSize: 16.0),
//                                             ),
//                                           ]),
//                                     ),
//                                     new Row(
//                                         mainAxisAlignment: MainAxisAlignment
//                                             .center,
//                                         children: [
//                                           new Radio(
//                                             value: 1,
//                                             groupValue: _radioValue,
//                                             onChanged: _handleRadioValueChange,
//                                           ),
//                                           new Text(
//                                             'No',
//                                             style: new TextStyle(
//                                                 fontSize: 16.0),
//                                           ),
//                                         ]),
//                                   ]),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 25, right: 25),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide:
//                                         BorderSide(
//                                             color: Color(0xffF2F2F2),
//                                             width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Grounding System',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Ground Rod',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Row(
//                                   children: [
//                                     Checkbox(
//                                       value: this.value13,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value13 = value!;
//                                         });
//                                       },
//                                     ),
//                                     Text(
//                                       'Needs Relacement',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Plumbing',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   'Water Supply',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Row(
//                                   children: [
//                                     Checkbox(
//                                       value: this.value17,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value17 = value!;
//                                         });
//                                       },
//                                     ),
//                                     Text(
//                                       'Needs Repair',
//                                       style: TextStyle(fontSize: 17.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Text(
//                                 'Water Closet(Toilet Only)',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Color(0xff707070),
//                                     fontFamily: 'San Francisco'),
//                               ),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Checkbox(
//                                       value: this.value14,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value14 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'Needs Repair',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Checkbox(
//                                       value: this.value15,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value15 = value!;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'Needs Replacement',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(
//                                   '1/2"Service Pipe',
//                                   style: TextStyle(
//                                       color: Color(0xff16698C),
//                                       fontFamily: 'San Francisco',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Row(
//                                   children: [
//                                     Checkbox(
//                                       value: this.value16,
//                                       onChanged: (bool? value) {
//                                         setState(() {
//                                           this.value16 = value!;
//                                         });
//                                       },
//                                     ),
//                                     Text(
//                                       'Needs Repair',
//                                       style: TextStyle(fontSize: 12.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 15, right: 16, bottom: 10),
//                                 child: TextFormField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter here',
//                                     hintStyle: TextStyle(
//                                         fontSize: 12,
//                                         color: Color(0xff808B9E),
//                                         fontFamily: 'San Francisco'),
//                                     border: OutlineInputBorder(
//                                         borderSide:
//                                         BorderSide(
//                                             color: Color(0xffF2F2F2),
//                                             width: 344)),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment
//                                       .spaceBetween,
//                                   children: [
//                                     Expanded(child: ElevatedButton(
//                                       onPressed: () {},
//                                       child: Text(
//                                         'CANCEL', style: TextStyle(
//                                           fontFamily: 'San Francisco',
//                                           fontWeight: FontWeight.w600),),
//                                       style: ElevatedButton.styleFrom(
//                                           primary: Color(0xffD45128),
//                                           fixedSize: Size(165, 46)),)),
//                                     SizedBox(
//                                       width: 14,
//                                     ),
//                                     Expanded(child: ElevatedButton(
//                                       onPressed: () {},
//                                       child: Text(
//                                         'NEXT', style: TextStyle(
//                                           fontFamily: 'San Francisco',
//                                           fontWeight: FontWeight.w600),),
//                                       style: ElevatedButton.styleFrom(
//                                           primary: Color(0xff12AFC0),
//                                           fixedSize: Size(165, 46)),))
//                                   ],
//                                 ),
//                               )
//                             ]));
//                   });
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             // By default show a loading spinner.
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
//   save(String accessToken) async {
//
//     localStorage.setString('access_token', accessToken);
//
//   }
// }
//
//
//
