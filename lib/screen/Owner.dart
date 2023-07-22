import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/screen/AddItem.dart';
import 'package:fooddelivery/screen/EditItem.dart';
import 'package:fooddelivery/screen/Orders.dart';

import 'Sales.dart';

class Owner extends StatefulWidget {
  const Owner({Key? key}) : super(key: key);

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(
           color: Colors.black
      ),
      child: Stack(
        children:[
          Container(
            height: mediaQueryData.size.height * 0.93,
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
                  bottom: mediaQueryData.size.height * 0.77, left: 10),
              child:   Row(
                children: [
                   IconButton(onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);}, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
                  const Text(
                    "Owner Dashboard",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),

                ],
              ),
            ),
          ),Positioned(
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height*0.9,
                color: Colors.cyan.shade50,
                child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: mediaQueryData.size.height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Additem()));
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(116, 149, 255, 0.8),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3))
                                ]),
                            child: const Padding(
                              padding: EdgeInsets.only(top:35.0),
                              child: Column(

                                children: [
                                Icon(Icons.add, color: Colors.black,size: 30,),
                                  SizedBox(height: 10,),
                                  Text(
                                    "Add Item",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            EditItem().method();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditItem()));
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(60, 110, 250, 0.8),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3))
                                ]),
                            child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Icon(Icons.edit, color: Colors.black,size: 30,),
                                  Text("Edit Item",style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),)]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: mediaQueryData.size.height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const Sales()));
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(137, 244, 224, 0.8),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3))
                                ]),
                            child:  const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),),
                                Text(
                                  "Sale",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>const Ordres()));
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(230, 128, 250, 0.8),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3))
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("0",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),),
                                Text("Orders",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),),
                              ],
                            ),
                          ),
                        )
                      ],
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