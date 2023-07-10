
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Services/JsonData.dart';
import 'addAddress.dart';


class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {

  DatabaseReference reference=FirebaseDatabase.instance.ref().child("UserAddress").child(FirebaseAuth.instance.currentUser!.uid);
  int recordCount = 0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   reference.once().then((DataSnapshot snapshot) {
  //     recordCount = snapshot.value?.snapshot.length ?? 0;
  //     print('Total number of records: $recordCount');
  //   } as FutureOr Function(DatabaseEvent value));
  //   }
    // Future<int> getNumberOfRecord() async {
    //
    //   final categoriesNumbersResponse = await FirebaseDatabase.instance
    //       .reference()
    //       .child('UserAddress')
    //       .child(FirebaseAuth.instance.currentUser!.uid!)
    //       .once();
    //   var categoryNodes = [];
    //   categoriesNumbersResponse.value.forEach((v) => categoryNodes.add(v));
    //   int numberOfCategories = categoryNodes.length;
    //   return numberOfCategories;
    // }
  String _name = "";
  String _phoneNumber = "";
  String _pincode = "";
  String _state = "";
  String _city = "";
  String _roadno = "";
  String _building = "";
  int total=0;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPincode = TextEditingController();
  final TextEditingController _controllerState = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerRoadNo = TextEditingController();
  final TextEditingController _controllerBuilding = TextEditingController();
  AddressWriteRead addressWriteRead=AddressWriteRead();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
              children: [
                Container(
                  width: mediaQueryData.size.width,
                  height: mediaQueryData.size.height  ,
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                  child: Padding(
                    padding:   EdgeInsets.only(bottom: mediaQueryData.size.height * 0.83, left: 20),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Address()), (route) => false);
                            },
                            icon: const Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                              size: 25,
                            )),
                        const Text(
                          "Add Address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                  ),
                ),
               Positioned(
                   top: 80,
                   child:ClipRRect(
                     borderRadius: BorderRadius.circular(25),
                     child: Container(
                       width: mediaQueryData.size.width,
                       height: mediaQueryData.size.height*0.9,
                       color: Colors.cyan.shade50,
                       child:  SingleChildScrollView(
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
                                         hintText: "Name (Required)*",
                                         label: const Text(
                                           "Name (Required)*",
                                           style: TextStyle(color: Colors.black),
                                         ),
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
                                         final jasonData = {
                                           "_name": _name,
                                           "_phoneNumber": _phoneNumber,
                                           "_pincode": _pincode,
                                           "_state": _state,
                                           "_city": _city,
                                           "_building": _building,
                                           "_road": _roadno
                                         };
                                         addressWriteRead.CreateDataBase("UserAddress",jasonData,FirebaseAuth.instance.currentUser!.uid);

                                         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const Address()), (route) => false);
                                         Fluttertoast.showToast(msg: "Address Added Successfully!",toastLength:Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey,textColor: Colors.white );
                                         _controllerRoadNo.clear();
                                         _controllerBuilding.clear();
                                         _controllerCity.clear();
                                         _controllerPhone.clear();
                                         _controllerPincode.clear();
                                         _controllerName.clear();
                                         _controllerState.clear();

                                       },
                                       child: const Text("Save Address"),
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ) )


              ],
            ),
         
        ),
      ),
    );
  }


}
