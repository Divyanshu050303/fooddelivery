import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'addAddress.dart';

class UpdateAddress extends StatefulWidget {
  final String addressKey;
  const UpdateAddress({super.key , required this.addressKey});


  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  String _name = "";
  String _phoneNumber = "";
  String _pincode = "";
  String _state = "";
  String _city = "";
  String _roadno = "";
  String _building = "";
  final ScrollController _scrollController = ScrollController();
  final   _controllerName = TextEditingController();
  final   _controllerPhone = TextEditingController();
  final  _controllerPincode = TextEditingController();
  final   _controllerState = TextEditingController();
  final   _controllerCity = TextEditingController();
  final   _controllerRoadNo = TextEditingController();
  final     _controllerBuilding = TextEditingController();
  late DatabaseReference dbref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbref=FirebaseDatabase.instance.ref().child("UserAddress").child(FirebaseAuth.instance.currentUser!.uid);
  }
  void getAddressData() async{
    DataSnapshot snapshot=await dbref.child(widget.addressKey).get();
    Map addressData=snapshot.value as Map;
    _controllerName.text=addressData['_name'];
    _name=addressData['_name'];
    _controllerPhone.text=addressData['_phoneNumber'];
    _phoneNumber=addressData['_phoneNumber'];
    _controllerPincode.text=addressData['_pincode'];
    _pincode=addressData['_pincode'];
    _controllerState.text=addressData['_state'];
    _state=addressData['_state'];
    _controllerCity.text=addressData['_city'];
    _city=addressData['_city'];
    _controllerRoadNo.text=addressData['_road'];
    _roadno=addressData['_road'];
    _controllerBuilding.text=addressData['_building'];
    _building=addressData['_building'];
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: const BoxDecoration(
          gradient:
          LinearGradient(colors: [Colors.white, Colors.cyan, Colors.white]),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height * 0.1,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.greenAccent, Colors.greenAccent])),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 5),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Address()), (route) => false);
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                            size: 25,
                          )),
                      const Text(
                        "Update Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: _scrollController,
                child: SizedBox(
                  width: mediaQueryData.size.width,
                  height: mediaQueryData.size.height * 0.8,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.03,
                                left: 7,
                                right: 7),
                            child: TextField(
                              controller: _controllerName,
                              onChanged: (value) => {_name = value},
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _name.isEmpty
                                            ? Colors.red
                                            : Colors.black,
                                        width: 2)),
                                hintText: _name,
                                // label: const Text(
                                //   "Name (Required)*",
                                //   style: TextStyle(color: Colors.black),
                                // ),
                                focusColor: Colors.black,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.13,
                                left: 7,
                                right: 7),
                            child: TextField(
                              controller: _controllerPhone,
                              onChanged: (value) => {_phoneNumber = value},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _phoneNumber.isEmpty
                                            ? Colors.red
                                            : Colors.black,
                                        width: 2)),
                                hintText: "Phone Number (Required)*",
                                label: const Text(
                                  "Phone Number (Required)*",
                                  style: TextStyle(color: Colors.black),
                                ),
                                focusColor: Colors.black,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.23,
                                left: 7,
                                right: 7),
                            child: TextField(
                              controller: _controllerPincode,
                              onChanged: (value) => {_pincode = value},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _pincode.isEmpty
                                            ? Colors.red
                                            : Colors.black,
                                        width: 2)),
                                hintText: "Pincode  (Required)*",
                                label: const Text(
                                  "Pincode (Required)*",
                                  style: TextStyle(color: Colors.black),
                                ),
                                focusColor: Colors.black,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.33,
                                left: 7,
                                right: 7),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) => {_state = value},
                                    controller: _controllerState,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _state.isEmpty
                                                  ? Colors.red
                                                  : Colors.black,
                                              width: 2)),
                                      hintText: "State (Required)*",
                                      label: const Text(
                                        "State (Required)*",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      focusColor: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) => {_city = value},
                                    controller: _controllerCity,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _city.isEmpty
                                                  ? Colors.red
                                                  : Colors.black,
                                              width: 2)),
                                      hintText: "City (Required)*",
                                      label: const Text(
                                        "City (Required)*",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      focusColor: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.43,
                                left: 7,
                                right: 7),
                            child: TextField(
                              onChanged: (value) => {_building = value},
                              controller: _controllerBuilding,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _building.isEmpty
                                            ? Colors.red
                                            : Colors.black,
                                        width: 2)),
                                hintText: "House No. Building Name (Required)*",
                                label: const Text(
                                  "House No. Building Name (Required)*",
                                  style: TextStyle(color: Colors.black),
                                ),
                                focusColor: Colors.black,
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.53,
                                left: 7,
                                right: 7),
                            child: TextField(
                              onChanged: (value) => {_roadno = value},
                              controller: _controllerRoadNo,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _roadno.isEmpty
                                            ? Colors.red
                                            : Colors.black,
                                        width: 2)),
                                hintText: "Road Name, Area, Colony(required*)",
                                label: const Text(
                                  "Road Name, Area, Colony(required)*",
                                  style: TextStyle(color: Colors.black),
                                ),
                                focusColor: Colors.black,
                              ),
                            )),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: mediaQueryData.size.height * 0.63,
                                left: 7,
                                right: 7),
                            child: ElevatedButton(
                              onPressed: () async {
                                Map<String, String> jason = {
                                  "_name": _controllerName.text,
                                  "_phoneNumber": _controllerPhone.text,
                                  "_pincode": _controllerPincode.text,
                                  "_state": _controllerState.text,
                                  "_city": _controllerCity.text,
                                  "_building": _controllerState.text,
                                  "_road": _controllerRoadNo.text
                                };
                                dbref.child(widget.addressKey).update(jason).then((value)=>{
                                Fluttertoast.showToast(msg: "Address Updated Successfully!",toastLength:Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey,textColor: Colors.white ),
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Address()), (route) => false)
                                });
                                _controllerRoadNo.clear();
                                _controllerBuilding.clear();
                                _controllerCity.clear();
                                _controllerPhone.clear();
                                _controllerPincode.clear();
                                _controllerName.clear();
                                _controllerState.clear();
                              },
                              child: const Text("Update Address"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
