import 'package:flutter/material.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,Colors.cyan,Colors.white]
          ),
        ),
  child: Column(
      children: [
        Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height*0.1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.greenAccent,Colors.greenAccent])
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:12.0,left: 5),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_outlined,color: Colors.black,size: 25,)),
                const Text("Add Address",style: TextStyle(color: Colors.black,fontSize: 20, decoration: TextDecoration.none),)
              ],
            ),
          ),
        ),
         Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height*0.8,
            child:SingleChildScrollView(
              child: Stack(
              children: [
                Padding(padding:EdgeInsets.only(top: mediaQueryData.size.height*0.03,left: 7,right: 7) ,child:
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 2)),
                    hintText: "Name  Required*",
                    label:   const Text(
                      "Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    focusColor: Colors.black,
                  ),
                )), Padding(padding:EdgeInsets.only(top: mediaQueryData.size.height*0.13,left: 7,right: 7) ,child:
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 2)),
                    hintText: "Phone Number  Required*",
                    label:   const Text(
                      "Phone Number ",
                      style: TextStyle(color: Colors.black),
                    ),
                    focusColor: Colors.black,
                  ),
                )), Padding(padding:EdgeInsets.only(top: mediaQueryData.size.height*0.23,left: 7,right: 7) ,child:
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 2)),
                    hintText: "Pincode  Required*",
                    label:   const Text(
                      "Pincode",
                      style: TextStyle(color: Colors.black),
                    ),
                    focusColor: Colors.black,
                  ),
                )), Padding(padding:EdgeInsets.only(top: mediaQueryData.size.height*0.33,left: 7,right: 7) ,child:
                Row(

                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                          hintText: "State Required*",
                          label:   const Text(
                            "State Required*",
                            style: TextStyle(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                    ),
                      const SizedBox(width: 7,),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                          hintText: "City Required*",
                          label:   const Text(
                            "City Required*",
                            style: TextStyle(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                        ),
                      ),
                    ),

                  ],
                )), Padding(padding:EdgeInsets.only(top: mediaQueryData.size.height*0.43,left: 7,right: 7) ,child:
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 2)),
                    hintText: "House No. Building Name (Required*)",
                    label:   const Text(
                      "House No. Building Name (Required*)",
                      style: TextStyle(color: Colors.black),
                    ),
                    focusColor: Colors.black,
                  ),
                )), Padding(padding:EdgeInsets.only(top: mediaQueryData.size.height*0.53,left: 7,right: 7) ,child:
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black, width: 2)),
                    hintText: "Quality",
                    label:   const Text(
                      "Quantity",
                      style: TextStyle(color: Colors.black),
                    ),
                    focusColor: Colors.black,
                  ),
                )),
                Center(
                  child: Padding(
                    padding:   EdgeInsets.only(top: mediaQueryData.size.height*0.63,left: 7,right: 7),
                    child: ElevatedButton(onPressed: (){}, child: Text("Save Address"),),
                  ),
                )



              ],
            ),
          ),
        )
      ],
  ),
      ),
    );
  }
}
