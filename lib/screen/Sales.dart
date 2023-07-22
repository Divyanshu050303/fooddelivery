import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Owner.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}
List<Map<String, dynamic>> dataList = [];
class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    return Stack(
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
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const Owner()) );
                }, icon: const Icon(Icons.arrow_back, color:Colors.white)),
                const Text("Add Sale", style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 20),)
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
  void getDataFromFirestore() {
    FirebaseFirestore.instance
        .collection('itemDetail')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;
        dataList.add(data);
      }
    });
    print(dataList.length);
  }
}
