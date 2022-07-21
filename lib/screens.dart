import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'first_screen.dart';
import 'houseowner_information.dart';
import 'second_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String accesstoken,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // DateTime selectedDate = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
           length: 2,
            child: Scaffold(
              appBar: AppBar(
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
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
                    );
                  },
                ),
                // Set this height

                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 21),
                  child: Text(
                    'DRA',
                    style: TextStyle(
                        fontFamily: 'Arial Rounded MT Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                backgroundColor: Color(0xff16698c),
                centerTitle: true,
                 toolbarHeight: 187.01,
                flexibleSpace: Padding(
                  padding:
                      const EdgeInsets.only( left: 16, right: 15,top: 120),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
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
                                                outsideDaysVisible: false,
                                                selectedDecoration:
                                                    BoxDecoration(
                                                        color:
                                                            Color(0xffD8F3FF),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff16698C)))),
                                            lastDay: DateTime.utc(2030, 3, 14),
                                            focusedDay: _focusedDay,
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
                                              headerPadding: EdgeInsets.only(
                                                  left: 200, top: 1),
                                              rightChevronPadding:
                                                  EdgeInsets.only(
                                                      left: 5, right: 5),
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
                                                  onPressed: () {},
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
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'CONFIRM',
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
                            ).then((value) => setState(() {}));
                            // _selectDate(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Datepick()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.black45,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  ("${_focusedDay.day}/${_focusedDay.month}/${_focusedDay.year}"),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(800, 30)),
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
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                },
                  child: Icon(Icons.filter_alt_outlined),
                backgroundColor: Color(0xff00b3bf),
              ),
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
                                    onPressed: () {},
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
                        onTap: () {},
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
                        leading: Icon(Icons.settings,
                            color: Color(0xffFFFFFF), size: 18),
                        title: const Text('Settings',
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
                        leading: Icon(Icons.logout,
                            color: Color(0xffFFFFFF), size: 18),
                        title: const Text('Logout',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'San Francisco',
                                color: Color(0xffFFFFFF))),
                        onTap: () {
                          Navigator.pop(context);
                        },
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
            )));
  }
}
