import 'package:flutter/material.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  State<Additem> createState() => _AdditemState();
}

const List<String> list = <String>[
  "South Indian",
  "Momo's",
  "Continental",
  "Cake",
  "Cold Drink",
];

class _AdditemState extends State<Additem> {
  String _SelectedString = "";
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
    _SelectedString = 'Option 1'; // Set initial value
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.cyan, Colors.white, Colors.cyan])),
      child: Column(
        children: [
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.1,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: mediaQueryData.size.height * 0.03),
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQueryData.size.width * 0.01,
                  ),
                  const Icon(Icons.arrow_back),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.05,
                  ),
                  const Text(
                    "Add item",
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
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.9,
            color: Colors.cyan,
            child: Scaffold(
              backgroundColor: Colors.cyan,
              body: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: mediaQueryData.size.width * 0.1,
                          right: mediaQueryData.size.width * 0.1,
                          top: mediaQueryData.size.height * 0.12),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          hintText: "ItemName",
                          label: const Text(
                            "ItemName",
                            style: TextStyle(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: mediaQueryData.size.width * 0.1,
                          right: mediaQueryData.size.width * 0.1,
                          top: 10),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          hintText: "Price",
                          label: const Text(
                            "Price",
                            style: TextStyle(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: mediaQueryData.size.width * 0.1,
                          right: mediaQueryData.size.width * 0.1,
                          top: 10),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          hintText: "Quantity",
                          label: const Text(
                            "Quantity",
                            style: TextStyle(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width > 400
                          ? mediaQueryData.size.width * 0.35
                          : mediaQueryData.size.width * .06,
                      right:MediaQuery.of(context).size.width > 400
                          ? mediaQueryData.size.width * 0.35
                          : mediaQueryData.size.width * .03,
                    ),
                    width: MediaQuery.of(context).size.width > 400
                        ? mediaQueryData.size.width * 0.65
                        : mediaQueryData.size.width * .9,
                    child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Padding(
                            padding: EdgeInsets.only(
                                left: mediaQueryData.size.width > 1000
                                    ? mediaQueryData.size.width * 0.25
                                    : mediaQueryData.size.width * 0.5),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            )),
                        elevation: 30,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        underline: Container(
                          height: 2,
                          width: 40,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: mediaQueryData.size.width * .008),
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ));
                        }).toList()),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width > 400
                            ? mediaQueryData.size.width * 0.35
                            : mediaQueryData.size.width * .7,
                        right:MediaQuery.of(context).size.width > 400
                            ? mediaQueryData.size.width * 0.35
                            : mediaQueryData.size.width * .03,
                      ),
                      width: MediaQuery.of(context).size.width > 400
                          ? mediaQueryData.size.width * 0.65
                          : mediaQueryData.size.width * .9,
                      child:const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Icon(Icons.camera_alt_rounded),
                          ),
                          Icon(Icons.image)
                        ],
                      ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(onPressed: (){}, child: const Text("Upload"),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
