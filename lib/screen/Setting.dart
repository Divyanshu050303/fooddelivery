

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/EditItem.dart';
import 'package:fooddelivery/screen/Owner.dart';
import 'package:fooddelivery/screen/SignIn.dart';
import 'package:provider/provider.dart';
import '../Services/SigningClass.dart';
import 'addAddress.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final String _selectedImage="assets/person.png";

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Container(
        height: mediaQueryData.size.height,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: const BoxDecoration(
                color: Colors.black
              ),
              child: Stack(
                children: [
                  Container(
                    height: mediaQueryData.size.height * 0.9,
                    width: mediaQueryData.size.width,

                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    // color: Colors.black26,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: mediaQueryData.size.height * 0.77, left: 30),
                      child: const Row(
                        children: [
                          Text(
                            "Setting",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top:80,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: mediaQueryData.size.height * 0.9,
                        width: mediaQueryData.size.width,
                        color: Colors.cyan.shade50,
                        child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 30),
                              child: Container(

                                color: Colors.transparent,

                                child:   Column(
                                  children: [
                                    Image.asset(
                                        "assets/person.png",width: 100, height: 100, fit: BoxFit.fill,
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
                                  EditItem().method();
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
                              padding: const EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: (){
                                  final provider =
                                  Provider.of<SingingAuth>(context, listen: false);
                                  provider.logout();
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));
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
                                ),
                              ))
                        ],
                ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: mediaQueryData.size.height*0.93,
                      child: Container(
                    width: mediaQueryData.size.width,
                    height: mediaQueryData.size.height*0.1,
                    color: Colors.black,
                  ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

