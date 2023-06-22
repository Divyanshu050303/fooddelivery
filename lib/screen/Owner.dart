import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/AddItem.dart';
import 'package:fooddelivery/screen/EditItem.dart';

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
          gradient: LinearGradient(
            colors: [Colors.white, Colors.cyan, Colors.white],
          )),
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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("0", style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),),
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
                Container(
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
                Container(
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
                      Text("User",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}