import 'package:flutter/material.dart';

class requestinfo extends StatefulWidget {
  const requestinfo({Key? key}) : super(key: key);

  @override
  State<requestinfo> createState() => _requestinfoState();
}

class _requestinfoState extends State<requestinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16698c),
        centerTitle: true,
        title: Text(
          'Edit Information',
          style: TextStyle(fontSize: 10, fontFamily: 'San Francisco'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Your Name'),
            ),
          ),

          Row(
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
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'San Francisco',
                        fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff12AFC0), fixedSize: Size(165, 46)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
