import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dra_project/assesment_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'assesment_page.dart';
import 'models/login_page_api/api_login.dart';

class Damages extends StatefulWidget {
  Damages({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  State<Damages> createState() => _DamagesState();
}

class _DamagesState extends State<Damages> with SingleTickerProviderStateMixin {
  @override
  bool typeNonImpact = false;
  bool typeHurImpact = false;

  bool windowAwing = false;
  bool windowSlider = false;
  bool windowcolonial = false;
  bool windowpush = false;

  bool typeNonImpact1 = false;
  bool typeHurImpact1 = false;

  bool windowAwing1 = false;
  bool windowSlider1 = false;
  bool windowcolonial1 = false;
  bool windowpush1 = false;

  bool typeNonImpact2 = false;
  bool typeHurImpact2 = false;

  bool windowAwing2 = false;
  bool windowSlider2 = false;
  bool windowcolonial2 = false;
  bool windowpush2 = false;

  bool locationInterior = false;
  bool locationExterrior = false;
  bool locationSolidCore = false;
  bool locationHollow = false;

  bool orientation_LH_Rverse = false;
  bool orientation_LH_Out = false;
  bool orientation_RH_Rverse = false;
  bool orientation_RH_Out = false;

  bool locationInterior1 = false;
  bool locationExterrior1 = false;
  bool locationSolidCore1 = false;
  bool locationHollow1 = false;

  bool orientation_LH_Rverse1 = false;
  bool orientation_LH_Out1 = false;
  bool orientation_RH_Rverse1 = false;
  bool orientation_RH_Out1 = false;

  bool locationInterior2 = false;
  bool locationExterrior2 = false;
  bool locationSolidCore2 = false;
  bool locationHollow2 = false;

  bool orientation_LH_Rverse2 = false;
  bool orientation_LH_Out2 = false;
  bool orientation_RH_Rverse2 = false;
  bool orientation_RH_Out2 = false;

  bool serviceRepair = false;
  bool serviceReplacement = false;
  bool servicePoleRepair = false;
  bool servicePoleReplacement = false;

  bool eleInteriorYes = false;
  bool eleInteriorNo = false;

  bool eleGroundRod = false;
  bool eleGroundClamp = false;
  bool eleGroundwire = false;

  bool plumingwater = false;
  bool  plumingwaterclosetRepair = false;
  bool  plumingwaterclosetReplacment = false;

  bool plumingservicePipe1 = false;
  bool plumingservicePipe2 = false;
  bool plumingservicePipe3 = false;








  final TextEditingController evenFeetController = TextEditingController();
  final TextEditingController evenInchController = TextEditingController();
  final TextEditingController fasciaFeetController = TextEditingController();
  final TextEditingController fasciaInchController = TextEditingController();

  final TextEditingController soffitBoardFeetController = TextEditingController();
  final TextEditingController soffitBoardInchController = TextEditingController();
  final TextEditingController soffitHeightFeetController = TextEditingController();
  final TextEditingController soffitHeightInchController = TextEditingController();

  final TextEditingController shinglesHeightFeetController = TextEditingController();
  final TextEditingController shinglesHeightInchController = TextEditingController();
  final TextEditingController shinglesWidthFeetController = TextEditingController();
  final TextEditingController shinglesWidthInchController = TextEditingController();

  final TextEditingController plywoodHeightFeetController = TextEditingController();
  final TextEditingController plywoodHeightInchController = TextEditingController();
  final TextEditingController plywoodWidthFeetController = TextEditingController();
  final TextEditingController plywoodWidthInchController = TextEditingController();

  final TextEditingController iceHeightFeetController = TextEditingController();
  final TextEditingController iceHeightInchController = TextEditingController();
  final TextEditingController iceWidthFeetController = TextEditingController();
  final TextEditingController iceWidthInchController = TextEditingController();

  final TextEditingController torchHeightFeetController = TextEditingController();
  final TextEditingController torchHeightInchController = TextEditingController();
  final TextEditingController torchWidthFeetController = TextEditingController();
  final TextEditingController torchWidthInchController = TextEditingController();

  final TextEditingController toughHeightFeetController = TextEditingController();
  final TextEditingController toughHeightInchController = TextEditingController();
  final TextEditingController toughWidthFeetController = TextEditingController();
  final TextEditingController toughWidthInchController = TextEditingController();

  final TextEditingController windowQuantityController = TextEditingController();
  final TextEditingController windowQuantity1Controller = TextEditingController();
  final TextEditingController windowQuantity2Controller = TextEditingController();

  final TextEditingController windowSizeHeightFeetController = TextEditingController();
  final TextEditingController windowSizeHeightInchController = TextEditingController();
  final TextEditingController windowSizeWidthFeetController = TextEditingController();
  final TextEditingController windowSizeWidthInchController = TextEditingController();

  final TextEditingController windowSize1HeightFeetController = TextEditingController();
  final TextEditingController windowSize1HeightInchController = TextEditingController();
  final TextEditingController windowSize1WidthFeetController = TextEditingController();
  final TextEditingController windowSize1WidthInchController = TextEditingController();

  final TextEditingController windowSize2HeightFeetController = TextEditingController();
  final TextEditingController windowSize2HeightInchController = TextEditingController();
  final TextEditingController windowSize2WidthFeetController = TextEditingController();
  final TextEditingController windowSize2WidthInchController = TextEditingController();


  final TextEditingController doorMaterialController = TextEditingController();
  final TextEditingController doorMaterial1Controller = TextEditingController();
  final TextEditingController doorMaterial2Controller = TextEditingController();

  final TextEditingController doorQuantityController = TextEditingController();
  final TextEditingController doorQuantity1Controller = TextEditingController();
  final TextEditingController doorQuantity2Controller = TextEditingController();

  final TextEditingController doorSizeHeightFeetController = TextEditingController();
  final TextEditingController doorSizeHeightInchController = TextEditingController();
  final TextEditingController doorSizeWidthFeetController = TextEditingController();
  final TextEditingController doorSizeWidthInchController = TextEditingController();

  final TextEditingController doorSize1HeightFeetController = TextEditingController();
  final TextEditingController doorSize1HeightInchController = TextEditingController();
  final TextEditingController doorSize1WidthFeetController = TextEditingController();
  final TextEditingController doorSize1WidthInchController = TextEditingController();

  final TextEditingController doorSize2HeightFeetController = TextEditingController();
  final TextEditingController doorSize2HeightInchController = TextEditingController();
  final TextEditingController doorSize2WidthFeetController = TextEditingController();
  final TextEditingController doorSize2WidthInchController = TextEditingController();

  final TextEditingController eleMeterSizeController = TextEditingController();
  final TextEditingController elaMeterSwitchController = TextEditingController();
  final TextEditingController elaFloadingFeetController = TextEditingController();
  final TextEditingController elaFloadingInchController = TextEditingController();

  final TextEditingController plumingLengthFeetController = TextEditingController();
  final TextEditingController plumingLengthInchController = TextEditingController();

  final TextEditingController plumingServiceFeetController = TextEditingController();
  final TextEditingController plumingServiceInchController = TextEditingController();

  final TextEditingController plumingService1FeetController = TextEditingController();
  final TextEditingController plumingService1InchController = TextEditingController();

  Map<String,String>? data =  Map();








  late AssesmentPage assesment;
  late SharedPreferences localStorage;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

  Assessment(String accessToken) async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      dynamic res = await _apiClient.assessment(
        accessToken,
      );
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (res?.statusCode == 200) {
        save(res['accessToken']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('successfully login'),
          backgroundColor: Colors.green.shade300,
        ));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => AssesmentPage()));

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.data['error']),
            backgroundColor: Colors.red.shade300,
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  String? gender;
  final List<String> _dropdownValues = ["One", "Two", "Three", "Four", "Five"];
  final List<String> softTypeDropDown = [
    "Plywood",
    "Vinyl",
    "Tounge & Groove T&G",
  ];
  final List<String> shinglesDropDown = [
    "Architectural",
    "Asphalt",
    "Metal",
    "Other",
  ];
  int _radioValue = 0;

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SharedPreferences.getInstance().then((value) {
    //   setState(() {
    //     localStorage = value;
    //   });
    // });
    return Scaffold(
      body: isLoading == true ? Center(child:CircularProgressIndicator()): ListView(children: [
        Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  color: Color(0xff16698C),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Roof Damage',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Eave Flashing',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: evenFeetController,
                decoration: InputDecoration(
                  hintText: 'eave-flashing-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: evenInchController,
                decoration: InputDecoration(
                  hintText: 'eave-flashing-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Fascia Board',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: fasciaFeetController,
                decoration: InputDecoration(
                  hintText: 'fascia-board-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: fasciaInchController,
                decoration: InputDecoration(
                  hintText: 'fascia-board-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Soffit',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: soffitBoardFeetController,
                decoration: InputDecoration(
                  hintText: 'fascia-board-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: soffitBoardInchController,
                decoration: InputDecoration(
                  hintText: 'fascia-board-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: soffitHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'soffit-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: soffitHeightInchController,
                decoration: InputDecoration(
                  hintText: 'soffit-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Soffit type',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: DropdownButton(
                      items: softTypeDropDown
                          .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (String? value) {},
                      isExpanded: false,
                      value: softTypeDropDown.first,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shingles',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: shinglesHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'shingles-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: shinglesHeightInchController,
                decoration: InputDecoration(
                  hintText: 'shingles-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: shinglesWidthFeetController,
                decoration: InputDecoration(
                  hintText: 'shingles-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: shinglesWidthInchController,
                decoration: InputDecoration(
                  hintText: 'shingles-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: DropdownButton(
                      items: shinglesDropDown
                          .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (String? value) {},
                      isExpanded: false,
                      value: shinglesDropDown.first,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Plywood',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: plywoodHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'plywood-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: plywoodHeightInchController,
                decoration: InputDecoration(
                  hintText: 'plywood-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: plywoodWidthFeetController,
                decoration: InputDecoration(
                  hintText: 'plywood-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: plywoodWidthInchController,
                decoration: InputDecoration(
                  hintText: 'plywood-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ice & Water Shield',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: iceHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'ice-and-water-shield-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: iceHeightInchController,
                decoration: InputDecoration(
                  hintText: 'ice-and-water-shield-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: iceWidthFeetController,
                decoration: InputDecoration(
                  hintText: 'ice-and-water-shield-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: iceWidthInchController,
                decoration: InputDecoration(
                  hintText: 'ice-and-water-shield-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Torch On',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: torchHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'torch-on-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: torchHeightInchController,
                decoration: InputDecoration(
                  hintText: 'torch-on-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: torchWidthFeetController,
                decoration: InputDecoration(
                  hintText: 'torch-on-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: torchWidthInchController,
                decoration: InputDecoration(
                  hintText: 'torch-on-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tough Guard',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: toughHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'tough-guard-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: toughHeightInchController,
                decoration: InputDecoration(
                  hintText: 'tough-guard-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: toughWidthFeetController,
                decoration: InputDecoration(
                  hintText: 'tough-guard-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: toughWidthInchController,
                decoration: InputDecoration(
                  hintText: 'tough-guard-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      color: Color(0xff16698C),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'windows',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'San Francisco',
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Type',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: this.typeNonImpact,
                          onChanged: (bool? value) {
                            setState(() {
                              this.typeNonImpact = value!;
                            });
                          },
                        ),
                        Text(
                          'NON-IMPACT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Checkbox(
                          value: this.typeHurImpact,
                          onChanged: (bool? value) {
                            setState(() {
                              this.typeHurImpact = value!;
                            });
                          },
                        ),
                        Text(
                          'HURRICANE IMPACT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Window Style',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Checkbox(
                            value: this.windowAwing,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowAwing = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Awining',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowSlider,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowSlider = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Slider',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowcolonial,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowcolonial = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Colonial',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowpush,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowpush = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Push up',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Quantity',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowQuantityController,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Size',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSizeHeightFeetController,
                decoration: InputDecoration(
                  hintText: 'size-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSizeHeightInchController,
                decoration: InputDecoration(
                  hintText: 'size-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSizeWidthFeetController,
                decoration: InputDecoration(
                  hintText: 'size-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSizeWidthInchController,
                decoration: InputDecoration(
                  hintText: 'size-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),

            ///------------------  second same form ---------------------------

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Type',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: typeNonImpact1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.typeNonImpact1 = value!;
                            });
                          },
                        ),
                        Text(
                          'NON-IMPACT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Checkbox(
                          value: this.typeHurImpact1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.typeHurImpact1 = value!;
                            });
                          },
                        ),
                        Text(
                          'HURRICANE IMPACT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Window Style',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Checkbox(
                            value: windowAwing1,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowAwing1 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Awining',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowSlider1,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowSlider1 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Slider',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowcolonial1,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowcolonial1 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Colonial',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowpush1,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowpush1 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Push up',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Quantity',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowQuantity1Controller,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Size',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize1HeightFeetController,
                decoration: InputDecoration(
                  hintText: 'size-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize1HeightInchController,
                decoration: InputDecoration(
                  hintText: 'size-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize1WidthFeetController,
                decoration: InputDecoration(
                  hintText: 'size-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize1WidthInchController,
                decoration: InputDecoration(
                  hintText: 'size-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),

            // ---------------------- same third form -----------------------------

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Type',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: typeNonImpact2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.typeNonImpact2 = value!;
                            });
                          },
                        ),
                        Text(
                          'NON-IMPACT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        Checkbox(
                          value: this.typeHurImpact2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.typeHurImpact2 = value!;
                            });
                          },
                        ),
                        Text(
                          'HURRICANE IMPACT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Window Style',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Checkbox(
                            value: windowAwing2,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowAwing2 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Awining',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowSlider2,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowSlider2 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Slider',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowcolonial2,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowcolonial2 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Colonial',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: this.windowpush2,
                            onChanged: (bool? value) {
                              setState(() {
                                this.windowpush2 = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Push up',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Quantity',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowQuantity2Controller,
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Size',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize2HeightFeetController,
                decoration: InputDecoration(
                  hintText: 'size-height-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize2HeightInchController,
                decoration: InputDecoration(
                  hintText: 'size-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize2WidthFeetController,
                decoration: InputDecoration(
                  hintText: 'size-width-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                 controller: windowSize2WidthInchController,
                decoration: InputDecoration(
                  hintText: 'size-width-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),

            // -------------------------------- end --------------------

            SizedBox(
              height: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    color: Color(0xff16698C),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Doors',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: 'San Francisco'),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.locationInterior,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationInterior = value!;
                          });
                        },
                      ),
                      Text(
                        'INTERIOR',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.locationExterrior,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationExterrior = value!;
                          });
                        },
                      ),
                      Text(
                        'EXTERIOR',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Type',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: 'San Francisco'),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.locationSolidCore,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationSolidCore = value!;
                          });
                        },
                      ),
                      Text(
                        'SOLID CORE',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.locationHollow,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationHollow = value!;
                          });
                        },
                      ),
                      Text(
                        'HOLLOW CORE',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meterial',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorMaterialController,
                  decoration: InputDecoration(
                    hintText: 'Meterial',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Orientation ',
                  style: TextStyle(
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.orientation_LH_Rverse,
                        onChanged: (bool? value) {
                          setState(() {
                            this.orientation_LH_Rverse = value!;
                          });
                        },
                      ),
                      Text(
                        'LH - REVERSE SWING',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.orientation_LH_Out,
                        onChanged: (bool? value) {
                          setState(() {
                            this.orientation_LH_Out = value!;
                          });
                        },
                      ),
                      Text(
                        'LH - OUT SWING',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.orientation_RH_Rverse,
                        onChanged: (bool? value) {
                          setState(() {
                            this.orientation_RH_Rverse = value!;
                          });
                        },
                      ),
                      Text(
                        'RH - REVERSE SWING',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.orientation_RH_Out,
                        onChanged: (bool? value) {
                          setState(() {
                            this.orientation_RH_Out = value!;
                          });
                        },
                      ),
                      Text(
                        'RH - OUT SWING',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorQuantityController,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Size',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSizeHeightFeetController,
                  decoration: InputDecoration(
                    hintText: 'size-height-feet',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSizeHeightInchController,
                  decoration: InputDecoration(
                    hintText: 'size-height-inches',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSizeWidthFeetController,
                  decoration: InputDecoration(
                    hintText: 'size-width-feet',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSizeWidthInchController,
                  decoration: InputDecoration(
                    hintText: 'size-width-inches',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              // -------------------- 2nd dublicate ----------------------

              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: 'San Francisco'),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.locationInterior1,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationInterior1 = value!;
                          });
                        },
                      ),
                      Text(
                        'INTERIOR',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.locationExterrior1,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationExterrior1 = value!;
                          });
                        },
                      ),
                      Text(
                        'EXTERIOR',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Type',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: 'San Francisco'),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.locationSolidCore1,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationSolidCore1 = value!;
                          });
                        },
                      ),
                      Text(
                        'SOLID CORE',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.locationHollow1,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationHollow1 = value!;
                          });
                        },
                      ),
                      Text(
                        'HOLLOW CORE',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meterial',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorMaterial1Controller,
                  decoration: InputDecoration(
                    hintText: 'Meterial',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Orientation ',
                  style: TextStyle(
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_LH_Rverse1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_LH_Rverse1 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'LH-IN',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_LH_Out1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_LH_Out1 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'LH-OUT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_RH_Rverse1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_RH_Rverse1 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'RH-IN',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_RH_Out1,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_RH_Out1 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'RH-OUT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorQuantity1Controller,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Size',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize1HeightFeetController,
                  decoration: InputDecoration(
                    hintText: 'size-height-feet',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize1HeightInchController,
                  decoration: InputDecoration(
                    hintText: 'size-height-inches',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize1WidthFeetController,
                  decoration: InputDecoration(
                    hintText: 'size-width-feet',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize1WidthInchController,
                  decoration: InputDecoration(
                    hintText: 'size-width-inches',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),


              // ------------------------- dublicate 3rd -----------------------------


              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: 'San Francisco'),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.locationInterior2,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationInterior2 = value!;
                          });
                        },
                      ),
                      Text(
                        'INTERIOR',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.locationExterrior2,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationExterrior2 = value!;
                          });
                        },
                      ),
                      Text(
                        'EXTERIOR',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                child: Text(
                  'Type',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: 'San Francisco'),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: this.locationSolidCore2,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationSolidCore2 = value!;
                          });
                        },
                      ),
                      Text(
                        'SOLID CORE',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Checkbox(
                        value: this.locationHollow2,
                        onChanged: (bool? value) {
                          setState(() {
                            this.locationHollow2 = value!;
                          });
                        },
                      ),
                      Text(
                        'HOLLOW CORE',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meterial',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorMaterial2Controller,
                  decoration: InputDecoration(
                    hintText: 'Meterial',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Orientation ',
                  style: TextStyle(
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_LH_Rverse2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_LH_Rverse2 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'LH-IN',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_LH_Out2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_LH_Out2 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'LH-OUT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_RH_Rverse2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_RH_Rverse2 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'RH-IN',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        child: Checkbox(
                          value: this.orientation_RH_Out2,
                          onChanged: (bool? value) {
                            setState(() {
                              this.orientation_RH_Out2 = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'RH-OUT',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorQuantity2Controller,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Size',
                  style: TextStyle(
                      color: Color(0xff16698C),
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize2HeightFeetController,
                  decoration: InputDecoration(
                    hintText: 'size-height-feet',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize2HeightInchController,
                  decoration: InputDecoration(
                    hintText: 'size-height-inches',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize2WidthFeetController,
                  decoration: InputDecoration(
                    hintText: 'size-width-feet',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
                child: TextFormField(
                   controller: doorSize2WidthInchController,
                  decoration: InputDecoration(
                    hintText: 'size-width-inches',
                    hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color(0xff808B9E),
                        fontFamily: 'San Francisco'),
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffF2F2F2), width: 344)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),


              // -------------------------- duplicate finish --------------------


            ]),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  color: Color(0xff16698C),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Electrical',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10),
              child: Text(
                'Service Entrance',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707070),
                    fontFamily: 'San Francisco'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Checkbox(
                    value: this.serviceRepair,
                    onChanged: (bool? value) {
                      setState(() {
                        this.serviceRepair = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Expanded(
                  child: Checkbox(
                    value: this.serviceReplacement,
                    onChanged: (bool? value) {
                      setState(() {
                        this.serviceReplacement = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Needs Replacement',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10),
              child: Text(
                'Service Pole',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707070),
                    fontFamily: 'San Francisco'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Checkbox(
                    value: this.servicePoleRepair,
                    onChanged: (bool? value) {
                      setState(() {
                        this.servicePoleRepair = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Expanded(
                  child: Checkbox(
                    value: this.servicePoleReplacement,
                    onChanged: (bool? value) {
                      setState(() {
                        this.servicePoleReplacement = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Needs Replacement',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                 Expanded(child:
                   Padding(padding: EdgeInsets.all(5),child: TextFormField(
                      controller: eleMeterSizeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: 'Meter Can Size',
                      ),
                  )   ),

                ),
              Expanded(child:
                  Padding(padding: EdgeInsets.all(5),child: TextFormField(
                controller: elaMeterSwitchController,

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: 'Meter Switch Size',
                      ),
                    ),

                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10),
              child: Text(
                'Interior Flooding',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707070),
                    fontFamily: 'San Francisco'),
              ),
            ),


                    Row(
                      children: <Widget>[
                       Checkbox(
                            value: this.eleInteriorYes,
                            onChanged: (bool? value) {
                              setState(() {
                                this.eleInteriorYes = value!;
                              });
                            },
                          ),

                        Text(
                            'YES',
                            style: TextStyle(fontSize: 12.0),
                          ),

                         Checkbox(
                            value: this.eleInteriorNo,
                            onChanged: (bool? value) {
                              setState(() {
                                this.eleInteriorNo = value!;
                              });
                            },
                          ),

                         Text(
                            'NO',
                            style: TextStyle(fontSize: 12.0),
                          ),



                      ],
                    ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  child: Text(
                    'Flooding Height',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                        fontFamily: 'San Francisco'),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: elaFloadingInchController,
                decoration: InputDecoration(
                  hintText: 'flooding-height-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
                  child: TextFormField(
                    controller: elaFloadingFeetController,
                    decoration: InputDecoration(
                      hintText: 'flooding-height-feet',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xff808B9E),
                          fontFamily: 'San Francisco'),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  color: Color(0xff16698C),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Grounding System',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ground Rod',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.eleGroundRod,
                    onChanged: (bool? value) {
                      setState(() {
                        this.eleGroundRod = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Replacement',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ground Clamp',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.eleGroundClamp,
                    onChanged: (bool? value) {
                      setState(() {
                        this.eleGroundClamp = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Replacement',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ground Wire',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.eleGroundwire,
                    onChanged: (bool? value) {
                      setState(() {
                        this.eleGroundwire = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Replacement',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  color: Color(0xff16698C),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Pluming',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Water Supply',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: this.plumingwater,
                    onChanged: (bool? value) {
                      setState(() {
                        this.plumingwater = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                'Water Closet(Toilet Only)',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707070),
                    fontFamily: 'San Francisco'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Checkbox(
                    value: this.plumingwaterclosetRepair,
                    onChanged: (bool? value) {
                      setState(() {
                        this.plumingwaterclosetRepair = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                Expanded(
                  child: Checkbox(
                    value: this.plumingwaterclosetReplacment,
                    onChanged: (bool? value) {
                      setState(() {
                        this.plumingwaterclosetReplacment = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    'Needs Replacement',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '1/2"Service Pipe',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.plumingservicePipe1,
                    onChanged: (bool? value) {
                      setState(() {
                        this.plumingservicePipe1 = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20),
              child: Text(
                'Length of damage',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: plumingLengthFeetController,
                decoration: InputDecoration(
                  hintText: 'length-of-damage-feet',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: plumingLengthInchController,
                decoration: InputDecoration(
                  hintText: 'length-of-damage-inches',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20),
              child: Text(
                '3/4 Service Pipe',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.plumingservicePipe2,
                    onChanged: (bool? value) {
                      setState(() {
                        this.plumingservicePipe2 = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: plumingServiceFeetController,
                decoration: InputDecoration(
                  hintText: 'length-of-damage-feet-one',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: plumingServiceInchController,
                decoration: InputDecoration(
                  hintText: 'length-of-damage-inches-one',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 15),
              child: Text(
                '1-service-pipe',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.plumingservicePipe3,
                    onChanged: (bool? value) {
                      setState(() {
                        this.plumingservicePipe3 = value!;
                      });
                    },
                  ),
                  Text(
                    'Needs Repair',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: plumingService1FeetController,
                decoration: InputDecoration(
                  hintText: 'length-of-damage-feet-two',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: TextFormField(
                controller: plumingService1InchController,
                decoration: InputDecoration(
                  hintText: 'length-of-damage-inches-two',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xffF2F2F2),
                  )),
                ),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'This field is required';
                //   }
                //   return null;
                // },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ]),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                 // widget.tabController.animateTo(1);

                  valiationPage();

                },
                child: Text('NEXT',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff12AFC0), fixedSize: Size(100, 46)),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void valiationPage(){


    print("eave-flashing-feet : ${evenFeetController.text}");
    print("eave-flashing-inches : ${evenInchController.text}");
    print("fascia-board-feet : ${fasciaFeetController.text}");
    print("fascia-board-inch : ${fasciaInchController.text}");



   /* data={
      "step":"2",
      "eave-flashing-feet":"1",
      "eave-flashing-inches":"2",
      "fascia-board-feet":"4",
      "fascia-board-inches":"5",
      "soffit-height-feet":"2",
      "soffit-height-inches":"3",
      "soffit-width-feet":"3",
      "soffit-width-inches":"3",
      "soffit-type":"2",


    };*/

    data={
      'step': '2',
      'eave-flashing-inches': 'test',
      'eave-flashing-feet': 'testfeet',
      'fascia-board-feet': 'testboard',
      'fascia-board-inches': 'testboardinch',
      'soffit-height-feet': '1',
      'soffit-height-inches': '1',
      'soffit-width-feet': '9',
      'soffit-width-inches': '9',
      'soffit-type': '2',
      'shingles-height-feet': '1',
      'shingles-height-inches': '7',
      'shingles-width-feet': '1',
      'shingles-width-inches': '1',
      'shingle-style': '1',
      'plywood-height-feet': '2',
      'plywood-height-inches': '3',
      'plywood-width-feet': '3',
      'plywood-width-inches': '4',
      'ice-and-water-shield-height-feet': '5',
      'ice-and-water-shield-width-feet': '6',
      'ice-and-water-shield-width-inches': '3',
      'ice-and-water-shield-height-inches': '4',
      'torch-on-height-feet': '3',
      'torch-on-height-inches': '3',
      'torch-on-width-feet': '3',
      'torch-on-width-inches': '4',
      'tough-guard-height-feet': '5',
      'tough-guard-height-inches': '6',
      'tough-guard-width-feet': '7',
      'tough-guard-width-inches': '8',
      'type': 'NON-IMPACT',
      'window-style': 'SLIDER',
      'quantity': '2',
      'size-height-feet': '3',
      'size-height-inches': '5',
      'size-width-feet': '4',
      'size-width-inches': '7',
      'type-one[]': 'NON-IMPACT',
      'window-style-one[]': 'COLONIAL',
      'quantity-one': '3',
      'size-height-feet-one': '3',
      'size-height-inches-one': '4',
      'size-width-feet-one': '6',
      'size-width-inches-one': '6',
      'type-two[]': 'NON-IMPACT',
      'window-style-two[]': 'AWNING',
      'quantity-two': '3',
      'size-height-feet-two': '5',
      'size-height-inches-two': '4',
      'size-width-feet-two': '5',
      'size-width-inches-two': '6',
      'location[]': 'INTERIOR',
      'door-type[]': 'HOLLOW CORE',
      'metirial': '8',
      'orientation[]': 'LH - REVERSE SWING',
      'door-quantity': '9',
      'door-size-height-feet': '4',
      'door-size-height-inches': '6',
      'door-size-width-feet': '7',
      'door-size-width-inches': '8',
      'location-one[]': 'INTERIOR',
      'door-type-one[]': 'SOLID CORE',
      'meterial-one': '3',
      'orientation-one[]': 'LH - OUT',
      'door-quantity-one': '3',
      'door-size-height-feet-one': '4',
      'door-size-height-inches-one': '6',
      'door-size-width-feet-one': '7',
      'door-size-width-inches-one': '6',
      'location-two[]': 'INTERIOR',
      'door-type-two[]': 'SOLID CORE',
      'meterial-two': '5',
      'orientation-two[]': 'LH - IN',
      'door-quantity-two': '4',
      'door-size-height-feet-two': '5',
      'door-size-height-inches-two': '5',
      'door-size-width-feet-two': '6',
      'door-size-width-inches-two': '7',
      'service-entrance[]': 'Needs Repair',
      'service-pole[]': 'Needs Repair',
      'meter-can-size': '2',
      'meter-switch-size': '4',
      'interior-flooding[]': 'No',
      'flooding-height-feet': '5',
      'flooding-height-inches': '6',
      'ground-rod[]': 'Needs Replacement',
      'ground-clamp[]': 'Needs Replacement',
      'ground-wire[]': 'Needs Replacement',
      'water-supply[]': 'Needs Repair',
      'water-closet[]': 'Needs Replacement',
      '1/2-service-pipe[]': 'Needs Repair',
      'length-of-damage-feet': '6',
      'length-of-damage-inches': '1',
      '3/2-service-pipe[]': 'Needs Repair',
      'length-of-damage-feet-one': '6',
      'length-of-damage-inches-one': '4',
      '1-service-pipe[]': 'Needs Repair',
      'length-of-damage-feet-two': '8',
      'length-of-damage-inches-two': '4',
      'form_type': 'create',
      'request_id': '23'


    };


    _updateDetail(data);

    // for(int i=0; i<selectedItems.length; i++){
    //
    //   print(selectedItems[i].orderId!);
    //
    //   data!.addAll({"order_id[$i]":selectedItems[i].orderId!.toString()});
    //
    //
    // }


    print('CHEKKKKKKKKKK VALUESSSSSSS 1111 ${data}');


  }
  void _updateDetail(_datas) async {
    setState(() {
      isLoading = true;
    });

    dynamic res = await _apiClient.damagesApi(_datas);
    setState(() {
      isLoading = false;
    });
    if (res?.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('successfully login'),
        backgroundColor: Colors.green.shade300,

      ));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => Basic(ids: '',)));
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res.data['error']),
        backgroundColor: Colors.red.shade300,
      ),
      );
    }
  }


  save(String accessToken) async {
    localStorage.setString('access_token', accessToken);
  }

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SecondRoute()),
      // );
    }
  }
}
