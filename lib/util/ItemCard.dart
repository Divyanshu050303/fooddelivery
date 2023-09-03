import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/orderSummary.dart';

List<Map<String, dynamic>> ItemList = [];
List<Map<String, dynamic>>datalist=[];

class ItemCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final String quantity;

  const ItemCard(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.quantity});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String _sale="sdfgh";
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 150,
        height: 210,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent.shade100, Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              style: BorderStyle.solid, color: Colors.black, width: 1),
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
            ClipRRect(
              borderRadius:BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                width: 150,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontFamily: 'Roboto-Regular'),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "\u20B9 ${widget.price}",
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(

                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent,
                      
                    ),
                    child: const Text("Buy", style: TextStyle(color: Colors.black),)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black26,

                    ),
                    onPressed: () {
                      if (ItemList.any((map) => map['name'] == widget.name)) {
                        int index = ItemList.indexWhere(
                            (map) => map['name'] == widget.name);
                        ItemList[index]['quantity'] =
                            (int.parse(widget.quantity) + 1).toString();
                      } else {
                        ItemList.add({
                          'name': widget.name,
                          'price':" ${widget.price}",
                          'image': widget.image,
                          'quantity': widget.quantity
                        });
                      }
                    },
                    child: const Text("Add")),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  void _showBottomSheet(BuildContext context) {
    int total = int.parse(widget.price);
    int qua = int.parse(widget.quantity);
    int quantity = 1;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)), ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.cyan.shade50,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3)),
                            ], borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(widget.image, width: 150)),
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, bottom: 30, left: 20),
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(fontSize: 20),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        qua -= 1;
                                        setState(() {
                                          quantity = qua;
                                          total =
                                              int.parse(widget.price) * quantity;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 20,
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
                                                color:
                                                    Colors.black.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: const Offset(0, 3))
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text("-"),
                                      )),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                      width: 40,
                                      height: 20,
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: const Offset(0, 3))
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(quantity.toString())),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        qua += 1;
                                        setState(() {
                                          quantity = qua;
                                          total =
                                              int.parse(widget.price) * quantity;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 20,
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
                                                color:
                                                    Colors.black.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: const Offset(0, 3))
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: const Text("+"),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                              )
                            ],
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.black,
                                width: 1)),
                        width: 80,
                        height: 40,

                          child: Text(
                            total.toString(),
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          Map<String, dynamic> datalistItem={
                              "name":widget.name,
                              "image":widget.image,
                              "quantity":widget.quantity,
                              "price":widget.price
                            };
                          datalist.add(datalistItem);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>  OrderSummary( itemDetailsList: datalist,)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                 color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    offset: Offset(0, 3),
                                  )
                                ],
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1)),
                            width: 120,
                            height: 40,
                            child:  const Text("buy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:Colors.white,
                                    fontSize: 20,
                                  )),
                            ),
                        ),

                      ],
                    ),
                  )
                ],
              ),

          ),
        );
      },
    );
  }
}
