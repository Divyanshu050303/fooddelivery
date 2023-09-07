import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/orderSummary.dart';
import 'package:fooddelivery/util/ItemCard.dart';
import 'Address.dart';

class SelectAddress extends StatefulWidget {
  List<Map<String, dynamic>> dataListItemDetails;

  SelectAddress(
      {super.key,
      required this.dataListItemDetails});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  Map<dynamic, dynamic> map={};
  String selectredAddres = "";
  Query dbref = FirebaseDatabase.instance
      .ref()
      .child("UserAddress")
      .child(FirebaseAuth.instance.currentUser!.uid);
  DatabaseReference reference = FirebaseDatabase.instance
      .ref()
      .child("UserAddress")
      .child(FirebaseAuth.instance.currentUser!.uid);
  // Map<dynamic,dynamic>_address={};


  Widget listItem({required Map address}) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top:18.0),
      child: Column(children: [
        SizedBox(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height*0.2,
            child: Scaffold(
              backgroundColor: Colors.white38,
              body: RadioListTile(
                title: Stack(
                  children: [
           Padding(
             padding: const EdgeInsets.only(right: 58.0),
             child: Text(address['_name'],style: const TextStyle(fontSize: 20,
               fontFamily: 'Roboto-Regular',  fontWeight: FontWeight.normal, ),textAlign: TextAlign.start,),
           ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Text(address['_building'] +
                          "\n" +
                          address['_road'] +
                          "\n" +
                          address['_city'] +
                          "\n" +
                          address['_state'] +
                          " " +
                          address['_pincode'] +
                          "\n" +
                          "Phone Number" +
                          ":" +
                          address['_phoneNumber'], style: const TextStyle(
                      fontFamily: 'Roboto-Regular',  fontWeight: FontWeight.normal,),),
                    ),
                  ],
                ),
                value: address['_name'],
                groupValue: selectredAddres,
                onChanged: (value) {
                  setState(() {
                    selectredAddres = value!;
                    addressName=value;
                    allAddress=address['_building'] +
                        "\n" +
                        address['_road'] +
                        "\n" +
                        address['_city'] +
                        "\n" +
                        address['_state'] +
                        " " +
                        address['_pincode'] +
                        "\n" +
                        "Phone Number" +
                        ":" +
                        address['_phoneNumber'];
                  });
                },
              ),
            ))
      ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(children: [
        SizedBox(
            height: mediaQueryData.size.height * 0.93,
            width: mediaQueryData.size.width,
            child: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: mediaQueryData.size.height * 0.77, left: 20),
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OrderSummary(
                                       itemDetailsList: datalist,
                                    )),
                            (route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      )),
                  const Text(
                    "My Addresses",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.14,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ))
                ]),
              ),
            )),
        Positioned(
          top: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height * 0.95,
              color: Colors.cyan.shade50,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAddress()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Container(
                        height: mediaQueryData.size.height * 0.07,
                        decoration: const BoxDecoration(color: Colors.blue),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add Address",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Roboto-Regular',
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: mediaQueryData.size.height * 0.3,
                    child: SizedBox(
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height * 0.8,
                      child: FirebaseAnimatedList(
                        query: dbref,
                        itemBuilder: (BuildContext context,
                            DataSnapshot snapshot,
                            Animation<double> animation,
                            int index) {
                          Map address = snapshot.value as Map;
                          address['key'] = snapshot.key;

                          return listItem(address: address);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
