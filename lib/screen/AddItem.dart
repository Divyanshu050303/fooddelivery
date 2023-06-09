import 'package:flutter/material.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    return Container(
      width:mediaQueryData.size.width ,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.cyan, Colors.white, Colors.cyan])
      ),
      child: Column(
        children: [
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height*0.08,

            color: Colors.white,
            child:  Row(
              children: [
                SizedBox(width: mediaQueryData.size.width*0.01,),
                Icon(Icons.arrow_back),
                SizedBox(width: mediaQueryData.size.width*0.02,),
                Text("Add item", style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),
                SizedBox(width: mediaQueryData.size.width*0.5,),
                Icon(Icons.search)
              ],

            ),

          ),
          Container(
            child: Column(
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}
