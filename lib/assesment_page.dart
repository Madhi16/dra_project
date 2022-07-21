import 'package:dra_project/screens.dart';
import 'package:flutter/material.dart';
import 'camera_access.dart';
import 'comments_screen.dart';
import 'damages_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import 'login_ui/login_page.dart';

class AssesmentPage extends StatefulWidget {
  const AssesmentPage({Key? key}) : super(key: key);

  @override
  State<AssesmentPage> createState() => _AssesmentPageState();
}

class _AssesmentPageState extends State<AssesmentPage> {
 // late TabController controller;



  // @override
  // void initState() {
  //   super.initState();
  //   controller = TabController(initialIndex: 0, length: 4, vsync: this);
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Column(
                  children: [
                    Text(
                      'Assesment ID',
                      style:
                          TextStyle(fontSize: 10, fontFamily: 'San Francisco'),
                    ),
                    Text('#12AAG3GDG4DFS643',
                        style: TextStyle(
                            fontSize: 14, fontFamily: 'San Francisco'))
                  ],
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeState(accesstoken: '',)));
                    },
                    icon: Icon(Icons.arrow_back_outlined)),
                backgroundColor: Color(0xff16698c),
                centerTitle: true,
                bottom: TabBar(
                  physics: NeverScrollableScrollPhysics(),
                 // controller: controller,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4,
                      color: Color(0xff00b3bf),
                    ),
                  ),
                  tabs: [
                    Tab(text: "Damages"),
                    Tab(text: "Comments"),
                    Tab(text: "Add Photo",)
                  ],
                ),
              ),

              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
              //  controller: controller,
                children: [
                  Damages(),
                  Comments(),
                  AddPhoto(),
                ],
              ),
            )));
  }
}
