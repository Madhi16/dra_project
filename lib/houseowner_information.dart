import 'package:dra_project/assesment_page.dart';
import 'package:dra_project/search_bar.dart';
import 'package:flutter/material.dart';

class FirstScreen1 extends StatefulWidget {
  const FirstScreen1({Key? key}) : super(key: key);

  @override
  State<FirstScreen1> createState() => _FirstScreen1State();
}

class _FirstScreen1State extends State<FirstScreen1> {
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
    return Scaffold(
      appBar: AppBar(title: Text('House Owner Information',style: TextStyle(color: Colors.white,fontFamily: 'San Francisco',fontSize: 14),),
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded)),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
        }, icon: Icon(Icons.search))
      ],
      backgroundColor: Color(0xff16698C),),
      body: ListView.builder(
          controller: controller,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10,top: 17),
                  child: InkWell(
                    child: buildCard(),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AssesmentPage()));},
                  ),
                ),
              ],
            );
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {  },child: Icon(Icons.add),backgroundColor: Color(0xff12AFC0),),
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
          padding: EdgeInsets.only(left: 18.0, bottom: 5,top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'David L. Birdwell',
                style:
                TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.bold, fontSize: 15,color: Color(0xff000000)),
              ),
              TextButton(onPressed: (){}, child: Icon(Icons.more_vert_outlined,color: Color(0xffA5A5A5),size: 10,))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            '16 Rr 2, Ketchikan, Alaska 99901,USA',
            style: TextStyle(color: Color(0xffA5A5A5), fontSize: 10,fontFamily: 'San Francisco'),
          ),
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: 18.0, top: 4, right: 8),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0,bottom: 8),
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
      ],
    ),
  );
}