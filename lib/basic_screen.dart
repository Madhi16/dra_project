import 'package:dra_project/request_info.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:table_calendar/table_calendar.dart';

import 'assesment_page.dart';

class Basic extends StatefulWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AssesmentPage()));
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {});
    }).catchError((e) {
      debugPrint(e);
    });
  }
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16698c),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Assesment ID',
              style: TextStyle(fontSize: 10, fontFamily: 'San Francisco'),
            ),
            Text('#12AAG3GDG4DFS643',
                style: TextStyle(fontSize: 14, fontFamily: 'San Francisco'))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 41.06,
            decoration: BoxDecoration(color: Color(0xff12AFC0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 23,top: 9,bottom: 8.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Houseowner Information', style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.w500),),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>requestinfo()));
                  },
                    child: Text('Request info Change', style: TextStyle(
                      color: Color(0xffEBEBEB),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'San Francisco',),),
                    style: TextButton.styleFrom(side: BorderSide(color: Colors.white),),),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 2, top: 10),
            child: Text(
              'House Owner Information',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 2),
            child: Text(
              'Mobile Number',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 2, top: 10),
            child: Text(
              'Email Address',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 2),
            child: Text(
              'Street Address',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 2, top: 10),
            child: Text(
              'Island',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 2),
            child: Text(
              'Home Number',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, bottom: 2, top: 10),
            child: Text(
              'Settlement',
              style: TextStyle(
                  color: Color(0xff808B9E),
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 16.0, right: 30, bottom: 2),
                    child: Text(
                      'Scheduled Date',
                      style: TextStyle(
                          color: Color(0xff808B9E),
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          fontFamily: 'San Francisco'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (context, setstate) {
                            return SingleChildScrollView(
                              reverse: true,
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Select Date',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'San Francisco,',
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TableCalendar(
                                      firstDay: DateTime.utc(2010, 10, 16),
                                      selectedDayPredicate: (day) {
                                        return isSameDay(_selectedDay, day);
                                      },
                                      onDaySelected: (selectedDay, focusedDay) {
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
                                          selectedDecoration: BoxDecoration(
                                              color: Color(0xffD8F3FF),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Color(0xff16698C)))),
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
                                        headerPadding:
                                        EdgeInsets.only(left: 200),
                                        rightChevronPadding:
                                        EdgeInsets.only(left: 5, right: 5),
                                        titleTextStyle:
                                        TextStyle(color: Color(0xff16698C)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'CANCEL',
                                              style: TextStyle(
                                                  fontFamily: 'San Francisco',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xffD45128),
                                                fixedSize: Size(165, 46)),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'CONFIRM',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'San Francisco',
                                                  fontSize: 12),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xff12AFC0),
                                                fixedSize: Size(165, 46)),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            ('Reshedule'),
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff16698C)),
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Color(0xffEBEBEB)),
                      textStyle: TextStyle(),
                      backgroundColor: Colors.white,
                      fixedSize: Size(86, 30),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 10),
              child: Text(
                'Detail1',
                style: TextStyle(
                    color: Color(0xff131313),
                    fontSize: 12,
                    fontFamily: 'San Francisco',
                    fontWeight: FontWeight.w500),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                          fontFamily: 'San Francisco',
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffD45128), fixedSize: Size(165, 46)),
                  ),
                ),
                SizedBox(width: 14,),

                ElevatedButton(

                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder( // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            reverse: true,
                            child: Column(children: <Widget>[
                              Container(
                                height: 180.21,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(20.0),
                                    topRight: const Radius.circular(20.0),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/geotag.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextButton(onPressed: () { Navigator.pop(context); },child: Image.asset(
                                        'assets/images/closed.png',),),
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/location.png',
                                          width: 100,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),),
                        //      Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                         //     Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                              Text('Enable Geo Tag',
                                  style: TextStyle(
                                      fontFamily: 'San Francisco',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              Padding(
                                padding:
                                EdgeInsets.only(left: 39, right: 48, bottom: 50),
                                child: Text(
                                    'Please enable geo location in order to capture your current location Latitude/Longitude',
                                    style: TextStyle(
                                        fontFamily: 'San Francisco',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16,bottom: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'CANCEL',
                                          style: TextStyle(
                                              fontFamily: 'San Francisco',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffD45128),
                                            fixedSize: Size(165, 46)),
                                      ),
                                    ),
                                    SizedBox(width: 14,),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print(_getCurrentPosition());
                                        },
                                        child: Text(
                                          'ENABLE GEO TAG',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'San Francisco',
                                              fontSize: 12),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xff12AFC0),
                                            fixedSize: Size(165, 46)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          );
                        },
                      );
                    },
                  child: Expanded(
                    child: Text(
                      'START ASSESSMENT',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'San Francisco',
                          fontSize: 12),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff12AFC0), fixedSize: Size(155, 46)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
