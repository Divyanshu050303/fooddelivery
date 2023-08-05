import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'editSales.dart';
import 'Owner.dart';

class Sales extends StatefulWidget {
  String sale, id;
  Sales({super.key, required this.sale, required this.id});

  @override
  State<Sales> createState() => _SalesState();
}


class _SalesState extends State<Sales> {
  final TextEditingController _sale = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Stack(
      children: [
        Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(bottom: mediaQueryData.size.height * 0.84),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Owner()));
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white)),
                const Text(
                  "Add Sale",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: 20),
                )
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
                  height: mediaQueryData.size.height * 0.9,
                  color: Colors.cyan.shade50,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: mediaQueryData.size.width * 0.1,
                            right: mediaQueryData.size.width * 0.1,
                            top: mediaQueryData.size.width * 0.3),
                        child: TextField(
                          onChanged: (value) {
                            widget.sale=value;
                          },
                          controller: _sale,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            focusColor: Colors.black,
                            hintText: "Sale",
                            labelText: "Sales",
                            // labelStyle:
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      ElevatedButton(onPressed: () {
                        _Update(_sale.text, widget.id);
                      }, child: const Text("Add Sale"))
                    ],
                  )),
            ))
      ],
    );
  }

  void _Update(String sale, String id) {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection("itemDetail");
    final DocumentReference documentReference=collectionReference.doc(id);

    documentReference.update({
      "sale":sale
    }).then((_) =>{

      Fluttertoast.showToast(
          msg: "Update Successfully",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.black,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          gravity: ToastGravity.BOTTOM),
      dataListsale.clear(),
      documentIdsale.clear(),
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const Owner()),
              (route) => false)
    }).catchError((error) => {Fluttertoast.showToast(
        msg: "Something Went Wrong",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        gravity: ToastGravity.BOTTOM)});
  }
}

