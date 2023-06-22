import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/ItemEdit.dart';

import 'Owner.dart';

class EditItem extends StatefulWidget {
  // const EditItem({super.key});

  method() => createState().getDataFromFirestore();

  @override
  _EditItemState createState() => _EditItemState();
}

List<Map<String, dynamic>> dataList = [];

class _EditItemState extends State<EditItem> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      color: Colors.cyan,
      child: Column(
        children: [
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.1,
            // color: Colors.cyan,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                      spreadRadius: 4,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: EdgeInsets.only(top: mediaQueryData.size.height * 0.04),
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQueryData.size.width * 0.04,
                  ),
                  GestureDetector(
                      onTap: () {
                        // dataList.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Owner()),
                                (route) => false);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 40,
                      )),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.06,
                  ),
                  const Text(
                    " Edit item",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.4,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: mediaQueryData.size.height * 0.9,
            width: mediaQueryData.size.width,
            padding: const EdgeInsets.only(bottom: 40),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.white, Colors.cyan],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: mediaQueryData.size.width > 900 ? 3 : 2,
                    mainAxisSpacing: mediaQueryData.size.width * 0.09,
                    childAspectRatio: 0.8),
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          left: mediaQueryData.size.width * 0.045,
                          right: mediaQueryData.size.width * 0.045),
                      child: GridTile(
                          child: GestureDetector(
                            onLongPress: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemEdit(itemName:dataList[index]['itemName'],itemPrice:dataList[index]['itemPrice'],itemQuantity:dataList[index]['itemQuantity'],image:dataList[index]['image'] )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.pinkAccent.shade100,
                                    Colors.white,
                                    Colors.white
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3))
                                ],
                              ),
                              child: ListView(
                                // controller: _scrollController,
                                  children: [
                                    Column(
                                      children: [
                                        Image.network(
                                          dataList[index]['image'],
                                          width: 150,
                                          height: 111,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Text(
                                          dataList[index]['itemName'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              decoration: TextDecoration.none),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          dataList[index]['itemPrice'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              decoration: TextDecoration.none),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                dataList.removeAt(index);
                                              });
                                              deleteDocumentByValue('itemDetail','itemName',dataList[index]['itemName'], dataList[index]['image']);
                                            },
                                            icon: const Icon(
                                              Icons.delete_forever_rounded,
                                              color: Colors.black,
                                            ))
                                      ],
                                    ),
                                  ]),
                            ),
                          )));
                }),
          ),
        ],
      ),
    );
  }

  void getDataFromFirestore() {
    FirebaseFirestore.instance
        .collection('itemDetail')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;
        // for(var map in dataList){
        //   if(map!=data){
          dataList.add(data);
        //   }
        // }
      });
    });
    print(dataList.length);
  }
  void deleteDocumentByValue(String collectionName, String fieldName, dynamic value, String imagePath) {
    FirebaseFirestore.instance
        .collection(collectionName)
        .where(fieldName, isEqualTo: value)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
    deleteImage(imagePath);
  }
  Future<void> deleteImage(String imagePath) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child(imagePath);
    try {
      await storageRef.delete();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deleted Succefully")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Error deleting image: $e")));
    }
  }
}
