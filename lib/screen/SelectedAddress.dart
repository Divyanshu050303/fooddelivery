import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddelivery/screen/updateAddress.dart';

import '../NavBar.dart';
import 'Address.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  Query dbref = FirebaseDatabase.instance.ref().child("UserAddress").child(
      FirebaseAuth.instance.currentUser!.uid);
  DatabaseReference reference = FirebaseDatabase.instance.ref().child(
      "UserAddress").child(FirebaseAuth.instance.currentUser!.uid);

  Widget listItem({required Map address}) {
    return   Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RadioListTile(value: "Tie", groupValue: "Time pass", onChanged: (val){print("Time");})
        ],
      ),
    );

    // return Scaffold(
    // body: Container(
    // margin: const EdgeInsets.all(10),
    // padding: const EdgeInsets.all(10),
    // height: 190,
    // width: 200,
    // decoration:const BoxDecoration(
    //     gradient: LinearGradient(colors: [Colors.white24,Colors.white24])
    // ),
    // child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       address['_name'],
    //       style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
    //     ),
    //     const SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       address['_building'].toString(),
    //       style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
    //     ),
    //     const SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       address['_road'],
    //       style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
    //     ),Text(
    //       address['_city'],
    //       style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
    //     ),Text(
    //       address['_state']+" "+address['_pincode'],
    //       style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
    //     ),
    //     Text(
    //       "Phone Number"+ ":"+address['_phoneNumber'],
    //       style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateAddress(addressKey: address['key'])));
    //           },
    //           child: const Row(
    //             children: [
    //               Icon(
    //                 Icons.edit,
    //                 // color: Theme.of(context).primaryColor,
    //                 color: Colors.black,
    //               ),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           width: 6,
    //         ),
    //         GestureDetector(
    //           onTap: () {
    //             reference.child(address['key']).remove();
    //             Fluttertoast.showToast(msg: "Address Deleted Successfully!",toastLength:Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey,textColor: Colors.white );
    //           },
    //           child: const Row(
    //             children: [
    //               Icon(
    //                 Icons.delete,
    //                 color: Colors.black,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // ),
    // child: RadioListTile(value: "Title",onChanged: (val){print("TimePass");},groupValue: "Time pass",

    //     ),
    //   ),
    // );

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.cyan, Colors.white])),
      child: Column(
        children: [
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.1,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.greenAccent, Colors.greenAccent]),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.8),
                      offset: const Offset(0, 2))
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context) => const NavBar()), (
                            route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                      )),
                  const Text(
                    "My Addresses",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.14,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQueryData.size.height * .02,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddAddress()));
            },
            child: Container(
              height: mediaQueryData.size.height * 0.08,
              width: mediaQueryData.size.width,
              decoration: const BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.black45, Colors.black54])),
              child: const Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Add Address", style: TextStyle(fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.8,
            child: FirebaseAnimatedList(
              query: dbref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map address = snapshot.value as Map;
                address['key'] = snapshot.key;
                return listItem(address: address);
              },
            ),
          )
        ],
      ),
    );
  }
}

