import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/Sales.dart';

import 'Owner.dart';

class Ordres extends StatefulWidget {
  const Ordres({super.key});

  @override
  State<Ordres> createState() => _OrdresState();
}

class _OrdresState extends State<Ordres> {
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
            padding:   EdgeInsets.only(bottom:mediaQueryData.size.height*0.84),
            child: Row(
              children: [
                IconButton(onPressed: (){
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Owner()), (route) => false);
                }, icon: const Icon(Icons.arrow_back, color:Colors.white)),
                const Text("Orders", style: TextStyle(color: Colors.white,
                    fontFamily: 'Roboto-Regular',decoration: TextDecoration.none, fontSize: 20),)
              ],
            ),
          ),
        ),
        Positioned(
            top: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height*0.9,
                color: Colors.cyan.shade50,

              ),
            ))
      ],

    );
  }
}
