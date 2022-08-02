import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'camera_access.dart';
import 'models/login_page_api/api_login.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key, required this.tabController,required this.str_id}) : super(key: key);
  final TabController tabController;
  final String str_id;

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final TextEditingController commentController = TextEditingController();
  bool isLoading = false;
  final ApiClient _apiClient = ApiClient();
  // void initState() {
  //   super.initState();
  //   var accessToken = "";
  //
  //   SharedPreferences.getInstance().then((token) {
  //     accessToken = token.getString("accessToken")!;
  //     // fetchData(accessToken);
  //     // futureData = fetchData(accessToken);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true ? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Additional Comments',
                style: TextStyle(
                    color: Color(0xff16698C),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'San Francisco'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 16, bottom: 308),
              child: TextFormField(
                controller: commentController,
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter Your Comment here',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff808B9E),
                      fontFamily: 'San Francisco'),
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xffF2F2F2), width: 344)),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(child: ElevatedButton(onPressed: (){}, child: Text('PREVIOUS',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600),),style: ElevatedButton.styleFrom(primary: Color(0xffD45128),fixedSize: Size(165, 46)),)),
            //       SizedBox(
            //         width: 14,
            //       ),
            //       Expanded(child: ElevatedButton(onPressed: (){}, child: Text('NEXT',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600)),style: ElevatedButton.styleFrom(primary: Color(0xff12AFC0),fixedSize: Size(165, 46)),))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                height: 40,
                color:Color(0xff12AFC0) ,
                textColor: Colors.white,
                onPressed: () {

                },
                child: Text('PREVIOUS',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w600)),

                // style: ElevatedButton.styleFrom(
                //     primary: Color(0xff12AFC0), fixedSize: Size(100, 46)),
              ),
            ),
            Expanded(
              child: FlatButton(
                height: 40,
                color:Color(0xff16698C) ,
                textColor: Colors.white,
                onPressed: () async {
                  var accessToken;
                  print(commentController.text);
                  print(widget.str_id);
                  await SharedPreferences.getInstance().then((token) {
                    accessToken = token.getString("accessToken")!;
                    // fetchData(accessToken);
                  });
                  print("dsadasdads $accessToken");
                  _updateDetailcomment(id: 'widget.str_id', accessToken: 'accessToken', comment: 'commentController.text');
                },
                child: Text('NEXT',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _updateDetailcomment({required String id, required String comment,required String accessToken}) async {
    setState(() {
      isLoading = true;
    });
    // var accessToken = '';
    // await SharedPreferences.getInstance().then((token) {
    //   accessToken = token.getString("accessToken")!;
    //   Comments = token.getString("Comments")!;
    //   print("Comments${token.getString("Comments")}");
    //   // fetchData(accessToken);
    // });
    var Comments = commentController.text;
    dynamic res = await _apiClient.Comment_screen(
        Comments,
        accessToken,
        widget.str_id
    );

    if (res?.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('successfully'),
        backgroundColor: Colors.green.shade300,
      ));

      setState(() {
        isLoading = false;
      });

      widget.tabController.animateTo(2);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => AddPhoto()));
    } else {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res.data['error']),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }
}