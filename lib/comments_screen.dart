import 'package:flutter/material.dart';
class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Additional Comments',
              style: TextStyle(color: Color(0xff16698C),fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 16,bottom: 308),
            child: TextFormField(
              minLines: 6,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(hintText: 'Enter Your Comment here',hintStyle: TextStyle(fontSize: 12,color: Color(0xff808B9E),fontFamily: 'San Francisco'),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF2F2F2),width: 344)
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: ElevatedButton(onPressed: (){}, child: Text('CANCEL',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600),),style: ElevatedButton.styleFrom(primary: Color(0xffD45128),fixedSize: Size(165, 46)),)),
                SizedBox(
                  width: 14,
                ),
                Expanded(child: ElevatedButton(onPressed: (){}, child: Text('NEXT',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600)),style: ElevatedButton.styleFrom(primary: Color(0xff12AFC0),fixedSize: Size(165, 46)),))
              ],
            ),
          ),

        ],
      ),
    );
  }
}
