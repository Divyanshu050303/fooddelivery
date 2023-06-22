import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddelivery/screen/Owner.dart';
import 'package:image_picker/image_picker.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  State<Additem> createState() => _AdditemState();
}

const List<String> list = <String>[
  "South Indian",
  "Momo's",
  "Continental",
  "Cake",
  "Cold Drink",
];

class _AdditemState extends State<Additem> {
  String _name = "";
  String _price="";
  String _quantity="";
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerquantity = TextEditingController();
  String dropdownValue = list.first;
  File? selectedImage;
  int itemNumber=0;


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.cyan, Colors.white, Colors.cyan])),
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
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Owner()), (route) => false);
                  },child: const Icon(Icons.arrow_back, size: 40,)),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.06,
                  ),
                  const Text(
                    "Add item",
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
                              _name=value;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2)),
                              hintText: "ItemName",
                              label: const Text(
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
                              _price=value;
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
                              hintText: "Price",
                              label: const Text(
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
                              _quantity=value;
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
                              hintText: "Quantity",
                              label: const Text(
                                "Quantity",
                                style: TextStyle(color: Colors.black),
                              ),
                              focusColor: Colors.black,
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width > 400
                              ? mediaQueryData.size.width * 0.35
                              : mediaQueryData.size.width * .06,
                          right: MediaQuery.of(context).size.width > 400
                              ? mediaQueryData.size.width * 0.35
                              : mediaQueryData.size.width * .03,
                        ),
                        width: MediaQuery.of(context).size.width > 400
                            ? mediaQueryData.size.width * 0.65
                            : mediaQueryData.size.width * .9,
                        child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Padding(
                                padding: EdgeInsets.only(
                                    left: mediaQueryData.size.width > 1000
                                        ? mediaQueryData.size.width * 0.25
                                        : mediaQueryData.size.width * 0.5),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                )),
                            elevation: 30,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            underline: Container(
                              height: 2,
                              width: 40,
                              color: Colors.black,
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items:
                                list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: mediaQueryData.size.width * .008),
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ));
                            }).toList()),
                      ),
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
                                :   Placeholder(child: Image.asset("assets/uploadimage.png", width: 100, height: 100,),),
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
                                      },
                                      child: const Icon(Icons.camera_alt_rounded)),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      selectPhoto();
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
                            _Upload();
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
  Future _Upload() async{
    final Reference storageRef= FirebaseStorage.instance.ref().child('image/${DateTime.now()}.png');
    final UploadTask uploadTask=storageRef.putFile(selectedImage!);
    final TaskSnapshot stroageSpnap=await uploadTask.whenComplete(() => null);
    final String image=await stroageSpnap.ref.getDownloadURL();

    if(identical(dropdownValue,"South Indian")){
      int south=0;
      await FirebaseFirestore.instance.collection('southIndian').add({
        'id':dropdownValue+south.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });await FirebaseFirestore.instance.collection('itemDetail').add({
        'id':dropdownValue+itemNumber.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });
      south+=1;
      itemNumber+=1;
    }
    else if(identical(dropdownValue,"Momo's")){
      int momo=0;
      await FirebaseFirestore.instance.collection('momos').add({
        'id':dropdownValue+momo.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });  await FirebaseFirestore.instance.collection('itemDetail').add({
        'id':dropdownValue+itemNumber.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });
      momo+=1;
      itemNumber+=1;
    }
    else if(identical(dropdownValue,"Continental")){
      int cont=1;
      await FirebaseFirestore.instance.collection('Continental').add({
        'id':dropdownValue+cont.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });  await FirebaseFirestore.instance.collection('itemDetail').add({
        'id':dropdownValue+itemNumber.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });
      cont+=1;
      itemNumber+=1;
    }
    else if(identical(dropdownValue,"Cake")){
      int cake=1;
      await FirebaseFirestore.instance.collection('Cake').add({
        'id':dropdownValue+cake.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });await FirebaseFirestore.instance.collection('itemDetail').add({
        'id':dropdownValue+itemNumber.toString(),
        'itemName':_name,
        'itemPrice':_price,
        'itemQuantity':_quantity,
        'image':image,
        'foodType':dropdownValue
      });
      cake+=1;
      itemNumber+=1;
    }
    else if(identical(dropdownValue,"Cold Drink")){
    int cold=1;
    await FirebaseFirestore.instance.collection('coldDrink').add({
      'id':dropdownValue+cold.toString(),
      'itemName':_name,
      'itemPrice':_price,
      'itemQuantity':_quantity,
      'image':image,
      'foodType':dropdownValue
    });
    await FirebaseFirestore.instance.collection('itemDetail').add({
      'id':dropdownValue+itemNumber.toString(),
      'itemName':_name,
      'itemPrice':_price,
      'itemQuantity':_quantity,
      'image':image,
      'foodType':dropdownValue
    });
    cold+=1;
    itemNumber+=1;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Upload Successfully')));
    if(uploadTask.snapshot.state==TaskState.success){
       _controllerName.clear();
       _controllerPrice.clear();
       _controllerquantity.clear();
       setState(() {
         // selectedImage="assets/"
       });
    }
  }
  // bool isSnackBarVisible(BuildContext context) {
  //   final scaffoldMessenger = ScaffoldMessenger.of(context).mounted ;
  //   return scaffoldMessenger.hasCurrentSnackBar;
  // }
}
