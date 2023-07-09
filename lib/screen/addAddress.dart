
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddelivery/NavBar.dart';
import 'package:fooddelivery/screen/updateAddress.dart';
import 'Address.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  Query dbref=FirebaseDatabase.instance.ref().child("UserAddress").child(FirebaseAuth.instance.currentUser!.uid);
  DatabaseReference reference=FirebaseDatabase.instance.ref().child("UserAddress").child(FirebaseAuth.instance.currentUser!.uid);


Widget listItem({required Map address}){
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: 190,
     decoration:BoxDecoration(
       gradient: LinearGradient(colors: [Colors.white24,Colors.white24])
     ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address['_name'],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          address['_building'].toString(),
          style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          address['_road'],
          style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
        ),Text(
          address['_city'],
          style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
        ),Text(
          address['_state']+" "+address['_pincode'],
          style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
        ),
        Text(
          "Phone Number"+ ":"+address['_phoneNumber'],
          style: const TextStyle(fontSize:18 , fontWeight: FontWeight.w400,decoration: TextDecoration.none,color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateAddress(addressKey: address['key'])));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.edit,
                    // color: Theme.of(context).primaryColor,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
              onTap: () {
                reference.child(address['key']).remove();
                Fluttertoast.showToast(msg: "Address Deleted Successfully!",toastLength:Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey,textColor: Colors.white );
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
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
        children:[ Container(
          height: mediaQueryData.size.height * 0.93,
          width: mediaQueryData.size.width,
          child:
              Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height ,
                decoration: BoxDecoration(
                    color: Colors.black,
                ),
                child: Padding(
                  padding:   EdgeInsets.only(bottom: mediaQueryData.size.height * 0.77, left: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>    NavBar(count: 2)), (route) => false);
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
                     ]
                  ),

              ),)),
              Positioned(
                top: 80,
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    width: mediaQueryData.size.width,
                    height: mediaQueryData.size.height*0.9,
                    color: Colors.cyan.shade50,
                    child: Column(
                      children: [
                          GestureDetector(
                            onTap: (){
                              print("Clicked");
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddAddress()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top:18.0),
                              child: Container(
                              height: mediaQueryData.size.height*0.07,

                              decoration: const BoxDecoration(
                                color: Colors.blue

                              ),
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
                            ),
                          ),
                        Positioned(
                                  top: mediaQueryData.size.height*0.3,
                          child: SizedBox(
                            width: mediaQueryData.size.width,
                            height: mediaQueryData.size.height*0.7,
                            child: FirebaseAnimatedList(
                              query: dbref,
                              itemBuilder: (BuildContext context, DataSnapshot snapshot,Animation<double> animation,int index){
                                Map address=snapshot.value as Map;
                                address['key']=snapshot.key;

                                return listItem(address:address);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ), ),

      ]),
    );
  }
}
