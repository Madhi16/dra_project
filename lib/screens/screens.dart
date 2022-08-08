
import 'package:dra_project/screens/assessor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/login_page_api/api_login.dart';
import '../ui/login_ui/login_page.dart';
import '../user_profile.dart';
import 'first_screen.dart';
import '../houseowner_information.dart';
import 'second_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
     String? accesstoken,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  late SharedPreferences localStorage;
  final ApiClient _apiClient = ApiClient();
  bool isLoading = false;
  Future<void> logout() async {
    await _apiClient.Logout(widget.toString());
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => login_page(access_token: '')));
  }

  final TextEditingController _searchQueryController =
  new TextEditingController();
  // logout(String access_token) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   if (_formKey.currentState!.validate()) {
  //     dynamic res = await _apiClient.Logout(
  //       access_token,
  //     );
  //     setState(() {
  //       isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //     if (res?.statusCode==200??false) {
  //       save(res['access_Token']);
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: const Text('Successfully logged out'),
  //         backgroundColor: Colors.green.shade300,
  //
  //       ));
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => HomeState(access_token: '',)));
  //
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content:  Text(res.data['error']),
  //         backgroundColor: Colors.red.shade300,
  //       ),
  //       );
  //     }
  //   }
  //   else
  //   {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  bool defaultdate = true;
  bool _hasText=false;
  // DateTime selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState

    SharedPreferences.getInstance().then((value) {
      setState(() {
        localStorage = value;
      });
    });


    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _searchQueryController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                leading: Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 35),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/menu.png',
                          height: 11.2,
                          width: 16,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      ),
                    );
                  },
                ),
                // Set this height

                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 21),
                  child: Image.asset('assets/images/img.png',width: 80,height: 80,),
                ),
                backgroundColor: Color(0xff16698c),
                centerTitle: true,
                toolbarHeight: 187.01,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 15, top: 150),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [


                    Container(
                    //margin: const EdgeInsets.all(12.0),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 7,
                                    color: Colors.grey)
                              ],
                            ),
                            child: Row(
                              children: [
                                IconButton(onPressed:() {}, icon: Icon(Icons.search,
                                  color: Colors.black87,

                                )),
                               // moodIcon(),
                                 Expanded(
                                  child: TextField(
                                    autofocus: false,
                                    controller: _searchQueryController,
                                    decoration: InputDecoration(
                                        hintText: "Search by name ",
                                        hintStyle: TextStyle(color: Colors.black87),
                                        border: InputBorder.none),

                                    onChanged: (content){

                                      if(content.length > 1){

                                        setState(() {
                                         _hasText=true;
                                        });

                                        _tabController.index==0?Provider.of<AssessorProvider>(context,listen: false).getAssessmentBasedOnDate("search","$content"):
                                        Provider.of<AssessorProvider>(context,listen: false).getSubmitedBasedOnDate("search","$content");                                        defaultdate = false;
                                        print("svsdvsdvdsvdsv $content");
                                      }else if (content.length == 0) {
                                        setState(() {
                                          _hasText=false;
                                        });

                                        _tabController.index==0?  Provider.of<AssessorProvider>(context,listen: false).getAssessmentBasedOnDate("search","") :
                                        Provider.of<AssessorProvider>(context,listen: false).getSubmitedBasedOnDate("search","");
                                        defaultdate = false;
                                      }


                                    },
                                  ),
                                ),
                               // attachFile(),
                              //  camera(),
                                _hasText ? GestureDetector(onTap:(){


                                 print("ffgdgf");

                                 setState(() {
                                   _hasText=false;
                                   _searchQueryController.text = "";
                                 });


                                   Provider.of<AssessorProvider>(context, listen: false).getAssessment();

                               },child:
                                Icon(Icons.cancel,
                                  color: Colors.black87,

                                ) ,):Container(width: 5,) ,
                               IconButton(onPressed:() {

                                 _callender();

                               }, icon: Icon(Icons.calendar_today_outlined,
                                 color: Colors.black87,

                               ))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Container(
                        //   padding: const EdgeInsets.all(15.0),
                        //   decoration: const BoxDecoration(
                        //       color: Color(0xFF00BFA5), shape: BoxShape.circle),
                        //   child: InkWell(
                        //     child: voiceIcon(),
                        //     onLongPress: () => callVoice(),
                        //   ),
                        // )
                      ],
                    ),
                  )



                      ],
                    ),
                  ),
                ),

                bottom: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4,
                      color: Color(0xff00b3bf),
                    ),
                  ),
                  tabs: [
                    Tab(text: "New"),
                    Tab(
                      text: "Submitted",
                    )
                  ],
                ),
              ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: (){
              //   },
              //     child: Icon(Icons.filter_alt_outlined),
              //   backgroundColor: Color(0xff00b3bf),
              // ),
              drawer: Drawer(
                backgroundColor: Color(0xff16698c),
                child: ListView(
                  children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 70.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Color(0xffFFFFFF),
                                      size: 18,
                                    ),
                                    splashRadius: 20,
                                  ),
                                ),
                                Text(
                                  'Navigation',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'San Francisco',
                                      color: Color(0xffFFFFFF)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: ListTile(
                        leading: Icon(Icons.date_range,
                            color: Color(0xffFFFFFF), size: 18),
                        title: const Text('Assessments',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'San Francisco',
                                color: Color(0xffFFFFFF))),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: ListTile(
                        leading: Icon(Icons.home,
                            color: Color(0xffFFFFFF), size: 18),
                        title: const Text('House Owner Information ',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'San Francisco',
                                color: Color(0xffFFFFFF))),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstScreen1()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: ListTile(
                        leading: Icon(Icons.person,
                            color: Color(0xffFFFFFF), size: 18),
                        title: const Text('Profile',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'San Francisco',
                                color: Color(0xffFFFFFF))),
                        onTap: () {
                          Navigator.pop(context);



                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>profile()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: Form(
                        child: ListTile(
                          leading: Icon(Icons.logout,
                              color: Color(0xffFFFFFF), size: 18),
                          title: const Text('Logout',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'San Francisco',
                                  color: Color(0xffFFFFFF))),
                          onTap: () async {

                            Navigator.pop(context);

                            // await _apiClient.Logout(
                            //     localStorage.getString("accessToken") ?? '');

                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            await preferences.clear();

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login_page(
                                        access_token: 'access_token')));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  FirstScreen(),
                  SecondScreen(),
                ],
              ),
            ));
  }

  void _callender(){
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setstate) {
              return SingleChildScrollView(
                reverse: true,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'Select Date',
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight.w600,
                                  fontFamily:
                                  'San Francisco,',
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      TableCalendar(
                        firstDay:
                        DateTime.utc(2010, 10, 16),
                        selectedDayPredicate: (day) {
                          return isSameDay(
                              _selectedDay, day);
                        },
                        onDaySelected:
                            (selectedDay, focusedDay) {
                          if (!isSameDay(
                              _selectedDay, selectedDay)) {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                            setstate(() {});
                          }
                        },
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            // Call `setState()` when updating calendar format
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          // No need to call `setState()` here
                          _focusedDay = focusedDay;
                        },
                        calendarStyle: CalendarStyle(
                            todayTextStyle: TextStyle(),
                            todayDecoration:
                            const BoxDecoration(
                                color:
                                Colors.transparent,
                                shape: BoxShape.circle),
                            outsideDaysVisible: false,
                            selectedDecoration:
                            BoxDecoration(
                                color:
                                Color(0xff16698C),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(
                                        0xffD8F3FF)))),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _selectedDay,
                        rangeSelectionMode:
                        RangeSelectionMode.toggledOff,
                        headerStyle: HeaderStyle(
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: Color(0xff16698C),
                          ),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: Color(0xff16698C),
                          ),
                          formatButtonVisible: false,
                          titleCentered: true,


                          titleTextStyle: TextStyle(
                              color: Color(0xff16698C)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                    fontFamily:
                                    'San Francisco',
                                    fontWeight:
                                    FontWeight.w600,
                                    fontSize: 12),
                              ),
                              style:
                              ElevatedButton.styleFrom(
                                  primary:
                                  Color(0xffD45128),
                                  fixedSize:
                                  Size(165, 46)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                var date="${_focusedDay.month}/${_focusedDay.day}/${_focusedDay.year}";
                                Provider.of<AssessorProvider>(context,listen: false).getAssessmentBasedOnDate("assign_date",date);
                                defaultdate = false;


                                setState(() {
                                  _hasText=true;
                                  _searchQueryController.text = date;
                                });
                                FocusScope.of(context).unfocus();


                                Navigator.pop(context);



                              },
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w600,
                                    fontFamily:
                                    'San Francisco',
                                    fontSize: 12),
                              ),
                              style:
                              ElevatedButton.styleFrom(
                                  primary:
                                  Color(0xff12AFC0),
                                  fixedSize:
                                  Size(165, 46)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }



  // Widget call (){
  //
  //   return  TextButton(
  //     onPressed: () {
  //
  //
  //       showModalBottomSheet<void>(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20),
  //                 topRight: Radius.circular(20))),
  //         isScrollControlled: true,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return StatefulBuilder(
  //               builder: (context, setstate) {
  //                 return SingleChildScrollView(
  //                   reverse: true,
  //                   child: Container(
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.only(
  //                               left: 10.0),
  //                           child: Row(
  //                             children: [
  //                               Text(
  //                                 'Select Date',
  //                                 style: TextStyle(
  //                                     fontWeight:
  //                                     FontWeight.w600,
  //                                     fontFamily:
  //                                     'San Francisco,',
  //                                     fontSize: 18),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         TableCalendar(
  //                           firstDay:
  //                           DateTime.utc(2010, 10, 16),
  //                           selectedDayPredicate: (day) {
  //                             return isSameDay(
  //                                 _selectedDay, day);
  //                           },
  //                           onDaySelected:
  //                               (selectedDay, focusedDay) {
  //                             if (!isSameDay(
  //                                 _selectedDay, selectedDay)) {
  //                               _selectedDay = selectedDay;
  //                               _focusedDay = focusedDay;
  //                               setstate(() {});
  //                             }
  //                           },
  //                           onFormatChanged: (format) {
  //                             if (_calendarFormat != format) {
  //                               // Call `setState()` when updating calendar format
  //                               setState(() {
  //                                 _calendarFormat = format;
  //                               });
  //                             }
  //                           },
  //                           onPageChanged: (focusedDay) {
  //                             // No need to call `setState()` here
  //                             _focusedDay = focusedDay;
  //                           },
  //                           calendarStyle: CalendarStyle(
  //                               todayTextStyle: TextStyle(),
  //                               todayDecoration:
  //                               const BoxDecoration(
  //                                   color:
  //                                   Colors.transparent,
  //                                   shape: BoxShape.circle),
  //                               outsideDaysVisible: false,
  //                               selectedDecoration:
  //                               BoxDecoration(
  //                                   color:
  //                                   Color(0xff16698C),
  //                                   shape: BoxShape.circle,
  //                                   border: Border.all(
  //                                       color: Color(
  //                                           0xffD8F3FF)))),
  //                           lastDay: DateTime.utc(2030, 3, 14),
  //                           focusedDay: _selectedDay,
  //                           rangeSelectionMode:
  //                           RangeSelectionMode.toggledOff,
  //                           headerStyle: HeaderStyle(
  //                             rightChevronIcon: Icon(
  //                               Icons.chevron_right,
  //                               color: Color(0xff16698C),
  //                             ),
  //                             leftChevronIcon: Icon(
  //                               Icons.chevron_left,
  //                               color: Color(0xff16698C),
  //                             ),
  //                             formatButtonVisible: false,
  //                             titleCentered: true,
  //                             headerPadding: EdgeInsets.only(
  //                                 left: 200, top: 1),
  //                             rightChevronPadding:
  //                             EdgeInsets.only(
  //                                 left: 5, right: 5),
  //                             titleTextStyle: TextStyle(
  //                                 color: Color(0xff16698C)),
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Row(
  //                             mainAxisAlignment:
  //                             MainAxisAlignment
  //                                 .spaceBetween,
  //                             children: [
  //                               ElevatedButton(
  //                                 onPressed: () {
  //
  //                                   Navigator.pop(context);
  //                                 },
  //                                 child: Text(
  //                                   'CANCEL',
  //                                   style: TextStyle(
  //                                       fontFamily:
  //                                       'San Francisco',
  //                                       fontWeight:
  //                                       FontWeight.w600,
  //                                       fontSize: 12),
  //                                 ),
  //                                 style:
  //                                 ElevatedButton.styleFrom(
  //                                     primary:
  //                                     Color(0xffD45128),
  //                                     fixedSize:
  //                                     Size(165, 46)),
  //                               ),
  //                               ElevatedButton(
  //                                 onPressed: () {
  //                                   Navigator.pop(context);
  //                                 },
  //                                 child: Text(
  //                                   'CONFIRM',
  //                                   style: TextStyle(
  //                                       fontWeight:
  //                                       FontWeight.w600,
  //                                       fontFamily:
  //                                       'San Francisco',
  //                                       fontSize: 12),
  //                                 ),
  //                                 style:
  //                                 ElevatedButton.styleFrom(
  //                                     primary:
  //                                     Color(0xff12AFC0),
  //                                     fixedSize:
  //                                     Size(165, 46)),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               });
  //         },
  //       ).then((value) => setState(() {
  //         var date="${_focusedDay.year}/${_focusedDay.month}/${_focusedDay.day}";
  //         Provider.of<AssessorProvider>(context,listen: false).getAssessmentBasedOnDate(date: date);
  //         defaultdate = false;
  //       }));
  //
  //       // ).then((value) => setState(() {
  //       // var date="${_focusedDay.year}/${_focusedDay.month}/${_focusedDay.day}";
  //       // Provider.of<AssessorProvider>(context,listen: false).getAssessmentBasedOnDate(date: date);
  //       // defaultdate = false;
  //       // }));
  //
  //       // _selectDate(context);
  //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Datepick()));
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.all(12.0),
  //       height: 60,
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(35.0),
  //                 boxShadow: const [
  //                   BoxShadow(
  //                       offset: Offset(0, 2),
  //                       blurRadius: 7,
  //                       color: Colors.grey)
  //                 ],
  //               ),
  //               child: Row(
  //                 children: [
  //                   //   moodIcon(),
  //                   const Expanded(
  //                     child: TextField(
  //                       decoration: InputDecoration(
  //                           hintText: "Message",
  //                           hintStyle: TextStyle(color: Color(0xFF00BFA5)),
  //                           border: InputBorder.none),
  //                     ),
  //                   ),
  //                   //  attachFile(),
  //                   // camera(),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const SizedBox(width: 15),
  //           // Container(
  //           //   padding: const EdgeInsets.all(15.0),
  //           //   decoration: const BoxDecoration(
  //           //       color: Color(0xFF00BFA5), shape: BoxShape.circle),
  //           //   child: InkWell(
  //           //     child: voiceIcon(),
  //           //     onLongPress: () => callVoice(),
  //           //   ),
  //           // )
  //         ],
  //       ),
  //     ),
  //     style: TextButton.styleFrom(
  //         backgroundColor: Colors.white,
  //         fixedSize: Size(800, 30)),
  //   );
  // }


}
