import 'dart:io';
import 'package:dra_project/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart'as http;


class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key, required this.tabController, required this.strIds}) : super(key: key);

  final TabController tabController;
  final String strIds;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPhoto();
  }
}

class _AddPhoto extends State<AddPhoto> {
  XFile? imageFile = null;

  bool isLoading = false;

  List<String> imageStrList = [];

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      imageSelector(context, "gallery");
                      Navigator.pop(context);
                      // _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      //   _openCamera(context);
                      imageSelector(context, "camera");
                      Navigator.pop(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      //  width: MediaQuery.of(context).size.width * 0.35,
                      //   height: MediaQuery.of(context).size.height * 0.2,
                      margin: EdgeInsets.only(top: 10),
                      child: imageStrList.isNotEmpty
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                  itemCount: imageStrList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                        leading: Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.file(
                                              File(imageStrList[index]),
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.fill,
                                            )),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.cancel,
                                            color: Colors.pink,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              imageStrList.removeAt(index);
                                            });
                                          },
                                        ),
                                        title: Text(File(imageStrList[index])
                                            .path
                                            .split('/')
                                            .last));
                                  }),
                            )
                          : Lottie.asset('assets/images/noimage.json')),
                  imageStrList.isEmpty
                      ? Text(
                          "No Images",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      : Text(""),
                  SizedBox(
                    height: 10,
                  ),
                  imageStrList.isEmpty == null
                      ? Text(
                          "There are no images captured. \n Please take a photo to view",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff808B9E),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(""),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: RaisedButton(
                          color: Colors.white,
                          onPressed: () {
                            _showChoiceDialog(context);
                            // _settingModalBottomSheet(context);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                  color: Color(0xff16698C), width: 1)),
                          child: Text("+Add/Take Picture"))),
                ],
              ),
            )),
      //   body: Center(child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           Container(
      //             width: MediaQuery.of(context).size.width * 0.35,
      //             height: MediaQuery.of(context).size.height * 0.2,
      //             margin: EdgeInsets.only(top: 20),
      //             child: imageFile != null
      //     ? Image.file((File(imageFile!.path)))
      //     :Lottie.asset('assets/images/noimage.json')
      // ),
      //
      //
      //           Text("No Images",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
      //           SizedBox(height: 10,),
      //           Text("There are no images captured. \nPlease take a photo to view",style: TextStyle(color: Color(0xff808B9E),fontSize: 12,fontWeight: FontWeight.w500),),
      //
      //           SizedBox(
      //             height: 10.0,
      //           ),
      //           RaisedButton(
      //               onPressed: () {
      //                 _showChoiceDialog(context);
      //                // _settingModalBottomSheet(context);
      //               },
      //               child: Text("+Add/Take Picture")),
      //           Spacer(),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(16.0),
      //           //   child: Row(
      //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           //     children: [
      //           //       Expanded(child: ElevatedButton(onPressed: (){}, child: Text('PREVIOUS',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600),),style: ElevatedButton.styleFrom(primary: Color(0xffD45128),fixedSize: Size(165, 46)),)),
      //           //       SizedBox(
      //           //         width: 14,
      //           //       ),
      //           //       Expanded(child: ElevatedButton(onPressed: (){}, child: Text('SUBMIT',style: TextStyle(fontFamily: 'San Francisco',fontWeight: FontWeight.w600)),style: ElevatedButton.styleFrom(primary: Color(0xff12AFC0),fixedSize: Size(165, 46)),))
      //           //     ],
      //           //   ),
      //           // ),
      //         ],
      //       )),

      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                height: 40,
                color: Color(0xff12AFC0),
                textColor: Colors.white,
                onPressed: () {
                  widget.tabController.animateTo(1);
                },
                child: Text('PREVIOUS',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w600)),
                // style: ElevatedButton.styleFrom(
                //     primary: Color(0xff12AFC0), fixedSize: Size(100, 46)),
              ),
            ),
            Expanded(
              child: FlatButton(
                height: 40,
                color: Color(0xff16698C),
                textColor: Colors.white,
                onPressed: () {
                  // widget.tabController.animateTo(2);

                   File _file = new File(imageStrList[0]);
                  print("ABCD");

                  if(imageStrList.isNotEmpty){
                    _upload();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please add images"),
                      backgroundColor: Colors.red.shade300,
                    ));

                  }


                },
                child: Text('SUBMIT',
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


  void _upload() async {
    List<http.MultipartFile> newList = [];

    setState(() {
      isLoading = true;
    });

    var kyc = Uri.parse("http://3.223.85.137/disaster_reconstruction/api/assessments/store/1");
    var request = new http.MultipartRequest("POST", kyc);
   // request.headers.addAll(headers);

    request.fields['step'] = "4";
    request.fields['form_type'] = "create";
    request.fields['request_id'] = "${widget.strIds}";


    for (int i = 0; i<imageStrList.length; i++ ) {
     // if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath(
          'damage-snaps[$i]',
          File(imageStrList[i]).path,
          filename: imageStrList[i].split('/').last,
        );
        newList.add(multipartFile);
     // }
    }
    request.files.addAll(newList);
    // int i = 0;
    // imageStrList.forEach((element) async {
    //
    //  // print("xczxczcxxzccz $element");
    //
    //   request.files.add( await http.MultipartFile.fromPath(
    //     'damage-snaps[$i]', element,
    //   ));
    //   i++;
    // });
    await request.send().then((value)  {
      if (value.statusCode == 200) {

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Assessment Form Store Successfully"),
                      backgroundColor: Colors.red.shade300,
                    ));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                  accesstoken: '',
                )));

        print("asadasdsadasdadsasdasd");
      }
    });
  }

    // String fileName = file.path.split('/').last;
    //
    // FormData data = FormData.fromMap({
    //   'step': '4',
    //   'form_type': "create",
    //   'request_id': "${widget.strIds}",
    //   "damage-snaps[0]'": await MultipartFile.fromFile(
    //     file.path,
    //     filename: fileName,
    //   ),
    // });
    //
    // Dio dio = new Dio();
    //
    // dio.post("http://3.223.85.137/disaster_reconstruction/api/assessments/store/1", data: data)
    //     .then((response) => print(response))
    //     .catchError(( error) => print("fgfsgfdgfgfggf$error"));



  // void _upload() async {
  //   print('EEEEEEEEEEEEEEEEEEEEEEEEEEE');
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   Map<String, dynamic> map = {
  //     'step': '4',
  //     'form_type': "create",
  //     'request_id': "${widget.strIds}",
  //   };
  //   var i = 0;
  //   imageStrList.forEach((element) async {
  //     File file = File(element);
  //     String fileName = file.path.split('/').last;
  //     map['damage-snaps[$i]'] = await MultipartFile.fromFile(
  //       file.path,
  //       filename: fileName,
  //       contentType: new MediaType("image", "jpeg"), //add this
  //     );
  //     i++;
  //   });
  //   FormData data = FormData.fromMap(map);
  //
  //   print("dsdfsdfsfs ${data}");
  //
  //   Dio dio = new Dio();
  //
  //   await dio.post(
  //           "http://3.223.85.137/disaster_reconstruction/api/assessments/store/1",
  //           data: data,onSendProgress: (int send,int total){
  //    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$send---$total'),duration: Duration(milliseconds: 500),));
  //   })
  //
  //       .then((response) {
  //         print(response.statusCode);
  //
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //           content: Text(response.data['message']),
  //           backgroundColor: Colors.red.shade300,
  //         ));
  // //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$data')));
  //     setState(() {
  //       isLoading = false;
  //     });
  //
  //     print("KKKKKKKKKKKKK $data");
  //   }).catchError((error) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Eroooooooor')));
  //     print("FFFFFFFFFFFFFFF $error");
  //     print(error);
  //   });
  // }

  //********************** IMAGE PICKER
  Future imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case "gallery":

        /// GALLERY IMAGE PICKER
        imageFile = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 90);
        break;

      case "camera": // CAMERA CAPTURE CODE
        imageFile = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 90);
        break;
    }

    if (imageFile != null) {
      print("You selected  image : " + imageFile!.path);

      imageStrList.add(imageFile!.path);

      print("LLLLLLLLLLLLLL $imageStrList");

      setState(() {
        debugPrint("SELECTED IMAGE PICK   $imageFile");
      });
    } else {
      print("You have not taken image");
    }
  }

// // Image picker
// void _settingModalBottomSheet(context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return Container(
//           child: new Wrap(
//             children: <Widget>[
//               new ListTile(
//                   title: new Text('Gallery'),
//                   onTap: () => {
//                         imageSelector(context, "gallery"),
//                         Navigator.pop(context),
//                       }),
//               new ListTile(
//                 title: new Text('Camera'),
//                 onTap: () => {
//                   imageSelector(context, "camera"),
//                   Navigator.pop(context)
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                         child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text(
//                         'PREVIOUS',
//                         style: TextStyle(
//                             fontFamily: 'San Francisco',
//                             fontWeight: FontWeight.w600),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           primary: Color(0xffD45128),
//                           fixedSize: Size(165, 46)),
//                     )),
//                     SizedBox(
//                       width: 14,
//                     ),
//                     Expanded(
//                         child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text('NEXT',
//                           style: TextStyle(
//                               fontFamily: 'San Francisco',
//                               fontWeight: FontWeight.w600)),
//                       style: ElevatedButton.styleFrom(
//                           primary: Color(0xff12AFC0),
//                           fixedSize: Size(165, 46)),
//                     ))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       });
// }
}
