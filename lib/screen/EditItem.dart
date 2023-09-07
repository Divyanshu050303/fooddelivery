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
List<String> documentId = [];

class _EditItemState extends State<EditItem> {
  bool loading = true;

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromFirestore();
    if (dataList.isEmpty) {
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      color: Colors.cyan.shade50,
      child: Column(
        children: [
          Stack(children: [
            Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              // color: Colors.cyan,
              decoration: const BoxDecoration(color: Colors.black, boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 2,
                    spreadRadius: 4,
                    offset: Offset(0, 3))
              ]),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: mediaQueryData.size.height * 0.85, left: 30),
                child: Row(
                  children: [
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
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: mediaQueryData.size.width * 0.06,
                    ),
                    const Text(
                      " Edit item",
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto-Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: mediaQueryData.size.width * 0.4,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: mediaQueryData.size.height * 0.98,
                  width: mediaQueryData.size.width,
                  padding: const EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(color: Colors.cyan.shade50),
                  child: loading
                      ? const Center( child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          strokeWidth: 8,
                          valueColor: AlwaysStoppedAnimation(Colors.black),
                        ))
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      mediaQueryData.size.width > 900 ? 3 : 2,
                                  mainAxisSpacing:
                                      mediaQueryData.size.width * 0.09,
                                  childAspectRatio: 0.8),
                          itemCount: dataList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: mediaQueryData.size.width * 0.045,
                                    right: mediaQueryData.size.width * 0.045),
                                child: GridTile(
                                    child: GestureDetector(
                                  onLongPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ItemEdit(
                                                  itemName: dataList[index]
                                                      ['itemName'],
                                                  itemPrice: dataList[index]
                                                      ['itemPrice'],
                                                  itemQuantity: dataList[index]
                                                      ['itemQuantity'],
                                                  image: dataList[index]
                                                      ['image'],
                                                  id: documentId[index],
                                                )));
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
                                            color:
                                                Colors.black.withOpacity(0.5),
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
                                                    fontFamily: 'Roboto-Regular',
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.black,
                                                    decoration:
                                                        TextDecoration.none),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                dataList[index]['itemPrice'],
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto-Regular',
                                                    fontWeight: FontWeight.normal,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      dataList.removeAt(index);
                                                    });
                                                    deleteDocumentByValue(
                                                        'itemDetail',
                                                        'itemName',
                                                        dataList[index]
                                                            ['itemName'],
                                                        dataList[index]
                                                            ['image']);
                                                  },
                                                  icon: const Icon(
                                                    Icons
                                                        .delete_forever_rounded,
                                                    color: Colors.black,
                                                  ))
                                            ],
                                          ),
                                        ]),
                                  ),
                                )));
                          }),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  void getDataFromFirestore() {
    bool t = true;
    FirebaseFirestore.instance
        .collection('itemDetail')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot documentSnapshot) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        String docId = documentSnapshot.id;
        // for(var map in dataList){
        var name = data['itemName'];
        for (var s in dataList) {
          if (s.containsValue(name)) {
            t = false;
          }
        }
        if (t) {
          dataList.add(data);
          documentId.add(docId);
        }

        // }
      });
    });
  }

  void deleteDocumentByValue(String collectionName, String fieldName,
      dynamic value, String imagePath) {
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
    final Reference storageRef =
        FirebaseStorage.instance.ref().child(imagePath);
    try {
      await storageRef.delete();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Deleted Successfully")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error deleting image: $e")));
    }
  }
}
