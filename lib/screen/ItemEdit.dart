import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddelivery/screen/EditItem.dart';
import 'package:image_picker/image_picker.dart';

class ItemEdit extends StatefulWidget {

    String itemName, itemPrice, itemQuantity, image;
    ItemEdit(  {super.key, required this.itemName,required this.itemPrice, required this.itemQuantity, required this.image });

  @override
  State<ItemEdit> createState() => _ItemEditState();
}

class _ItemEditState extends State<ItemEdit> {
    TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerquantity = TextEditingController();
  bool _name=false;
  bool _image=false;
  bool _price=false;
  bool _quantity=false;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(
         color: Colors.black
      ),
      child: Column(
        children: [
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.1,
            // color: Colors.cyan,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                boxShadow:[ BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    spreadRadius: 4,
                    offset: Offset(0,3)
                )]
            ),
            child: Padding(
              padding: EdgeInsets.only(top: mediaQueryData.size.height * 0.04),
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQueryData.size.width * 0.04,
                  ),
                  GestureDetector(onTap:(){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  EditItem()), (route) => false);
                  },child: const Icon(Icons.arrow_back, size: 40,)),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.06,
                  ),
                  const Text(
                    "Edit itemDetail ",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.4,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.9,
            color: Colors.cyan,
            child: Scaffold(
              backgroundColor: Colors.cyan,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: mediaQueryData.size.width * 0.1,
                            right: mediaQueryData.size.width * 0.1,
                            top: mediaQueryData.size.height * 0.12),
                        child: TextField(
                          controller: _controllerName,
                          onChanged: (value){
                            widget.itemName=value;
                            setState(() {
                            _name=true;
                            });
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                            hintText:widget.itemName ,
                            label:   const Text(
                              "ItemName",
                              style: TextStyle(color: Colors.black),
                            ),
                            focusColor: Colors.black,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: mediaQueryData.size.width * 0.1,
                            right: mediaQueryData.size.width * 0.1,
                            top: 10),
                        child: TextField(
                          onChanged: (value){
                            widget.itemPrice=value;
                            setState(() {
                              _price=true;
                            });
                          },
                          controller: _controllerPrice,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                            hintText:widget.itemPrice ,
                            label:   const Text(
                              "Price",
                              style: TextStyle(color: Colors.black),
                            ),
                            focusColor: Colors.black,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: mediaQueryData.size.width * 0.1,
                            right: mediaQueryData.size.width * 0.1,
                            top: 10),
                        child: TextField(
                          onChanged: (value){
                            widget.itemQuantity=value;
                            setState(() {
                              _quantity=true;
                            });
                          },
                          controller: _controllerquantity,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                            hintText: widget.itemQuantity,
                            label:   const Text(
                              "Quantity",
                              style: TextStyle(color: Colors.black),
                            ),
                            focusColor: Colors.black,
                          ),
                        )),
                    Container(
                      color: Colors.cyan,
                      width: MediaQuery.of(context).size.width > 400
                          ? mediaQueryData.size.width * 0.65
                          : mediaQueryData.size.width * .9,
                      child: Column(
                        children: [
                          selectedImage != null
                              ? Image.file(
                            selectedImage!,
                            width: 100,
                            height: 100,
                          )
                              :   Placeholder(child: Image.network(widget.image,width: 100, height: 100 ,fit: BoxFit.fill,),),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.01,
                                  left: MediaQuery.of(context).size.width > 400
                                      ? mediaQueryData.size.width * 0.35
                                      : mediaQueryData.size.width * .4,
                                  right: MediaQuery.of(context).size.width > 400
                                      ? mediaQueryData.size.width * 0.35
                                      : mediaQueryData.size.width * .03,
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      capturePhoto();
                                      setState(() {
                                        _image=true;
                                      });
                                    },
                                    child: const Icon(Icons.camera_alt_rounded)),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    selectPhoto();
                                    setState(() {
                                      _image=true;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(top:7.0),
                                    child: Icon(Icons.image),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          _Update();
                        },
                        child: const Text("Upload"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future selectPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    } else {
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
    }
  }

  Future capturePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    } else {
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          gravity: ToastGravity.BOTTOM);
    }
  }
  void _Update() {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

    // Specify the path to the value you want to update
    DatabaseReference valueReference = databaseReference.child('ite');

    // Update the value
    valueReference.set('New Value')
        .then((_) => print('Value updated successfully.'))
        .catchError((error) => print('Error updating value: $error'));
  }
}
