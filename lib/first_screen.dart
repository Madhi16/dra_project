import 'package:flutter/material.dart';
import 'basic_screen.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
 late ScrollController controller;
  List<String> items = List.generate(10, (index) => 'Hello $index');

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView.builder(
          controller: controller,
          itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
        child: Text(
          'Today',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Container(
          child: InkWell(child: buildCard(), onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Basic(),));

          },),
        ),
      ),
        ],
      );
  }
      ),
    );
  }
  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 5) {
      setState(() {
        items.addAll(List.generate(10, (index) => 'Inserted $index'));
      });
    }
  }
}

  Card buildCard() {
    return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.white,
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding:
                       EdgeInsets.only(left: 18.0,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'David L. Birdwell',
                        style:
                        TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.bold, fontSize: 15,color: Color(0xff000000)),
                      ),

                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Color(0xffA5A5A5),
                          minimumSize: Size(10, 0)
                        ),
                        onPressed: () { },
                        child: Icon(Icons.more_vert,size: 10,),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 18.0,top: 5),
                  child: Text(
                    '16 Rr 2, Ketchikan, Alaska 99901,USA',
                    style: TextStyle(color: Color(0xffA5A5A5), fontSize: 10,fontFamily: 'San Francisco'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0,top: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 8,
                          ),
                          backgroundColor: Color(0xff00b3bf),
                        ),
                      ),
                      Text('David@dra.com',style: TextStyle(fontFamily: 'San Francisco',fontSize: 10,fontWeight: FontWeight.w700,color: Color(0xff000000)),),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 20),
                        child: CircleAvatar(
                          radius: 10,
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 8,
                          ),
                          backgroundColor: Color(0xff00b3bf),
                        ),
                      ),
                      Text('229-200-3671-229-200-3671',style: TextStyle(fontFamily: 'San Francisco',fontSize: 10,fontWeight: FontWeight.w700,color: Color(0xff000000)),),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0,right: 8),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                      '#12AAG3GDG4DFS643',
                      style: TextStyle(
                          fontFamily: 'San Francisco',
                          color: Color(0xff16698C),
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,right: 10),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,color: Colors.black,size: 12,),
                          Text('11/7/2022',style: TextStyle(color: Colors.black,fontSize: 10),),

                        ],
                      ),
                    )
                  ],),
                )
              ],
            ),
          );
  }