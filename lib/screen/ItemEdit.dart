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
    final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerquantity = TextEditingController();
  bool _name=false;
  bool _image=false;
  bool _price=false;
  bool _quantity=false;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    return  Stack(
      children: [
        Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          color: Colors.black,
          child: Padding(
            padding:   EdgeInsets.only(bottom: mediaQueryData.size.height*0.84),
            child: Row(
              children: [
                IconButton(onPressed:(){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  EditItem()), (route) => false);
                } , icon: const Icon(Icons.arrow_back, color: Colors.white, size:25,)),
                const Text("Edit Item", style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none),)
              ],
            ),
          ),
        ),
        Positioned(
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
          color: Colors.cyan.shade50,
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height*0.9,
                child:
                Column(
                  children: [
                    Container(
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height * 0.9,
                      color: Colors.cyan.shade50,
                      child: Scaffold(
                        backgroundColor: Colors.cyan.shade50,
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
                              SizedBox(height: 10,),
                              Container(
                                color: Colors.cyan.shade50,
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
        ),
            ))
      ],
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
    DatabaseReference valueReference = databaseReference.child('itemDetails');
    valueReference.set('New Value')
        .then((_) => print('Value updated successfully.'))
        .catchError((error) => print('Error updating value: $error'));
  }
}
