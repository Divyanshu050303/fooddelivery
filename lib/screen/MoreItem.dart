import 'package:flutter/material.dart';
import 'package:fooddelivery/util/ItemCard.dart';

class MoreItem extends StatefulWidget {
  const MoreItem({Key? key}) : super(key: key);

  @override
  State<MoreItem> createState() => _MoreItemState();
}

class _MoreItemState extends State<MoreItem> {
  List<Map<String, dynamic>> ItemList = [
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
    {'name': 'dosh', 'price': 23, 'image': 'assets/img_1.png'},
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.cyan, Colors.white, Colors.cyan],
              begin: Alignment.topRight,
              end: Alignment.bottomRight)),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: mediaQueryData.size.width * 0.09,
          ),
          itemCount: ItemList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(
                    left: mediaQueryData.size.width * 0.045,
                    right: mediaQueryData.size.width * 0.045),
                child: GridTile(
                    child: Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white],
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
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img_1.png',
                        fit: BoxFit.fitHeight,
                      ),
                      const Text(
                        "Masala Dosh",
                        style: TextStyle(fontSize: 20,color: Colors.black, decoration: TextDecoration.none),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text("buy")),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Add")),
                        ],
                      )
                    ],
                  ),
                )));
          }),
    );
  }
}
