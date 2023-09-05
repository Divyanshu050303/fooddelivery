import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'Owner.dart';

class Ordres extends StatefulWidget {
  const Ordres({super.key});

  @override
  State<Ordres> createState() => _OrdresState();
}

class _OrdresState extends State<Ordres> {
  Query dbref = FirebaseDatabase.instance
      .ref()
      .child("Orders").child(FirebaseAuth.instance.currentUser!.uid);
  DatabaseReference reference = FirebaseDatabase.instance
      .ref()
      .child("UserAddress")
      .child(FirebaseAuth.instance.currentUser!.uid);

  Widget listItem({required List address, required String addressName, required String allAddress}) {
    bool packed=false, delivered=false, onTheWay=false;
    return Flexible(
      child: Container(

        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),

        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white24, Colors.white])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              addressName,
              style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Roboto-Regular',
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              allAddress,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto-Regular',
                  decoration: TextDecoration.none,
                  color: Colors.black),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            for(int i=0;i<address.length;i++)
              Text(
                "\n${address[i]["name"]} \nQuantity : ${address[i]["quantity"]}4",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto-Regular',
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    packed=true;
                  });
                }, icon:packed?  Icon(Icons.check_box_outlined ,color: Colors.green,size: 30,):Icon(Icons.backpack_outlined,size: 30,),),
                IconButton(onPressed: (){}, icon: Icon(Icons.local_shipping_outlined,size: 30)),
                IconButton(onPressed: (){}, icon: Icon(Icons.home,size: 30)),
              ],
            )


            // Text(
            //   address['_city'],
            //   style: const TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w400,
            //       fontFamily: 'Roboto-Regular',
            //       decoration: TextDecoration.none,
            //       color: Colors.black),
            // ),
            // Text(
            //   address['_state'] + " " + address['_pincode'],
            //   style: const TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w400,
            //       decoration: TextDecoration.none,
            //       fontFamily: 'Roboto-Regular',
            //       color: Colors.black),
            // ),
            // Text(
            //   "Phone Number" + ":" + address['_phoneNumber'],
            //   style: const TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w400,
            //       decoration: TextDecoration.none,
            //       fontFamily: 'Roboto-Regular',
            //       color: Colors.black),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (_) =>
            //                     UpdateAddress(addressKey: address['key'])));
            //       },
            //       child: const Row(
            //         children: [
            //           Icon(
            //             Icons.edit,
            //             // color: Theme.of(context).primaryColor,
            //             color: Colors.black,
            //           ),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 6,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         reference.child(address['key']).remove();
            //         Fluttertoast.showToast(
            //             msg: "Address Deleted Successfully!",
            //             toastLength: Toast.LENGTH_SHORT,
            //             gravity: ToastGravity.BOTTOM,
            //             backgroundColor: Colors.grey,
            //             textColor: Colors.white);
            //       },
            //       child: const Row(
            //         children: [
            //           Icon(
            //             Icons.delete,
            //             color: Colors.black,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
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
            )),
        Positioned(
          top: mediaQueryData.size.height * 0.101,
          child: SizedBox(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.9,
            child: FirebaseAnimatedList(
              query: dbref,
              itemBuilder: (BuildContext context,
                  DataSnapshot snapshot,
                  Animation<double> animation,
                  int index) {
                final Map<String, dynamic> dataList = Map<String, dynamic>.from(snapshot.value as Map);
                final String stringValue1 = dataList['AddressName'];
                final String stringValue2 = dataList['AddressDetails'];
                final List<dynamic> listOfMaps = dataList['ItemDetails'];
                return listItem(address: listOfMaps, addressName: stringValue1, allAddress: stringValue2);
              },
            ),
          ),
        )
      ],

    );
  }
}
