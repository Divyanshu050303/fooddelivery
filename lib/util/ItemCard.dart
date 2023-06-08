

import 'package:flutter/material.dart';
List<Map<String, dynamic>> ItemList = [];
class ItemCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String quantity;
  const ItemCard({super.key, required this.name, required this.image, required this.price, required this.quantity});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return    Container(
      width: 150,
      height: 210,
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [Colors.pinkAccent.shade100, Colors.white,Colors.white],
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
            widget.image,
             width: 150,
            height: 100,
            fit:BoxFit.fitWidth,
          ),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
          "\u20B9 ${widget.price}",
            style: const TextStyle(fontSize: 20),
          ),
          // if(widget.name.isNotEmpty)
          //     Text(
          //       widget.name,
          //       style: const TextStyle(fontSize: 20),
          //     ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("buy")),
              ElevatedButton(
                  onPressed: () {
                  ItemList.add({
                    'name':widget.name,
                    'price': "\u20B9 ${widget.price}",
                    'image':widget.image,
                    'quantity':widget.quantity
                  });
                  }, child: const Text("Add")),
            ],
          )
        ],
      ),
    );
  }
}
