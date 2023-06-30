import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Address.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
                gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.greenAccent]),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.8),
                      offset: Offset(0, 2))
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
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
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddAddress()));
            },
            child: Container(
              height: mediaQueryData.size.height*0.08,
              width: mediaQueryData.size.width,
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.black45, Colors.black54])),
              child: const Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Row(
                  children: [
                    Icon(Icons.add,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text("Add Address", style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
