

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/Owner.dart';
import 'package:image_picker/image_picker.dart';

import 'addAddress.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final String _selectedImage="assets/person.png";
  // Future<void> _pickImageFromGallery() async{
  //   final picker=ImagePicker();
  //   final pickedImage= await picker.getImage(source: ImageSource.gallery);
  //   if(pickedImage!=null){
  //     setState(() {
  //       _selectedImage=File(pickedImage.path as List<Object>) as String;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan, Colors.white, Colors.cyan],
              ),
            ),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Container(

                      color: Colors.transparent,

                      child:   Column(
                        children: [
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(50),
                          //     // color: Colors.black
                          //   ),
                          //   width: 100,
                          //   height: 100,
                          //   child:
                          // ),
                          Image.asset(
                            "assets/person.png",
                            width: 100,
                            height: 100,
                            fit:BoxFit.fitWidth,
                          ),
                          Padding(padding:EdgeInsets.only(left: mediaQueryData.size.width*0.1, right:  mediaQueryData.size.width*0.1, top: 10),child:
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                              ),
                              hintText: "Name",
                              label:const Text(
                                "Name",
                                style: TextStyle(color: Colors.black),
                              ),
                              focusColor: Colors.black,
                              suffixIcon: const Icon(Icons.edit)

                            ),
                          )),
                          Padding(padding:EdgeInsets.only(left: mediaQueryData.size.width*0.1, right:  mediaQueryData.size.width*0.1, top: 10),child:
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                              ),
                              hintText: "Email",
                              label:const Text(
                                "Email",
                                style: TextStyle(color: Colors.black),
                              ),
                              focusColor: Colors.black,
                                suffixIcon: const Icon(Icons.edit)
                            ),
                          )
                          ),
                          Padding(padding:EdgeInsets.only(left: mediaQueryData.size.width*0.1, right:  mediaQueryData.size.width*0.1, top: 10),child:
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border:OutlineInputBorder(
                                borderRadius:BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2),
                              ),
                              hintText: "Number",
                              label:const Text(
                                "Number",
                                style: TextStyle(color: Colors.black),
                              ),
                              focusColor: Colors.black,
                                suffixIcon: const Icon(Icons.edit),



                            ),
                          ))
                        ],
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Owner()));
                      },
                      child: Container(
                        width: mediaQueryData.size.width * 0.81,
                        height: mediaQueryData.size.height * 0.07,
                        decoration: BoxDecoration(
                          
                            gradient: const LinearGradient(
                                colors: [Colors.white, Colors.white]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3))
                            ],
                            
                            border: Border.all(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid),borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.add,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Owner",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Address()));
                      },
                      child: Container(
                        width: mediaQueryData.size.width * 0.81,
                        height: mediaQueryData.size.height * 0.07,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.white, Colors.white]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3))
                            ],
                            border: Border.all(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid), borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.place,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      width: mediaQueryData.size.width * 0.81,
                      height: mediaQueryData.size.height * 0.07,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white]),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 3))
                          ],
                          border: Border.all(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid), borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.logout,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

