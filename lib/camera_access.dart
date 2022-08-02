import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPhoto();
  }
}

class _AddPhoto extends State<AddPhoto> {
  XFile? imageFile = null;
  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  imageSelector(context, "gallery");
                  Navigator.pop(context);
                 // _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
               //   _openCamera(context);
                  imageSelector(context, "camera");
                  Navigator.pop(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
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
      body:  Center(child: Container(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.only(top: 0),
                    child: imageFile != null
            ? Image.file((File(imageFile!.path)))
            :Lottie.asset('assets/images/noimage.json')
        ),


            imageFile == null ?  Text("No Images",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),):Text(""),
                      SizedBox(height: 10,),
            imageFile == null ?    Text("There are no images captured. \n Please take a photo to view",textAlign:TextAlign.center,style: TextStyle(color: Color(0xff808B9E),fontSize: 12,fontWeight: FontWeight.w500),):Text(""),

                      SizedBox(
                        height: 10.0,
                      ),

        Container(height: 45,
            padding: EdgeInsets.only(left: 10,right: 10),
            child: RaisedButton(
          color: Colors.white,
                        onPressed: () {
                          _showChoiceDialog(context);
                         // _settingModalBottomSheet(context);
                        },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Color(0xff16698C), width: 1)
            ),
                        child: Text("+Add/Take Picture"))),


          ],),)),
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
          color:Color(0xff12AFC0) ,
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
                  widget.tabController.animateTo(2);
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
      setState(() {
        debugPrint("SELECTED IMAGE PICK   $imageFile");
      });
    } else {
      print("You have not taken image");
    }
  }

  // Image picker
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    title: new Text('Gallery'),
                    onTap: () => {
                          imageSelector(context, "gallery"),
                          Navigator.pop(context),
                        }),
                new ListTile(
                  title: new Text('Camera'),
                  onTap: () => {
                    imageSelector(context, "camera"),
                    Navigator.pop(context)
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'PREVIOUS',
                          style: TextStyle(
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffD45128),
                            fixedSize: Size(165, 46)),
                      )),
                      SizedBox(
                        width: 14,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        child: Text('NEXT',
                            style: TextStyle(
                                fontFamily: 'San Francisco',
                                fontWeight: FontWeight.w600)),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff12AFC0),
                            fixedSize: Size(165, 46)),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
