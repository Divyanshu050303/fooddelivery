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
                  onPressed: () {
                    _showBottomSheet(context);
                  }, child: const Text("buy")),
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
  void _showBottomSheet(BuildContext context) {
    int qua=int.parse(widget.quantity);
    int quantity=1;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          color: Colors.cyan,
          child: Padding(padding: const EdgeInsets.only(bottom: 50),
            child: Row(
                children: [
                  const SizedBox(width: 20,),
                Image.asset(widget.image, width: 150,height: 250,),

                 Column(
                  children: [
                      Padding(padding:const EdgeInsets.only(top:50,bottom: 30, left: 20),child: Text(widget.name, style: const TextStyle(fontSize: 20),)),

                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: (){
                                qua-=1;
                                setState(() {
                                  quantity=qua;

                                });
                              },
                              child:Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
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
                                alignment: Alignment.center,
                                child:const Text("-" ),
                              )),
                          Container(
                              width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
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
                              alignment: Alignment.center,
                              child:  Text(quantity.toString())),
                          GestureDetector(
                              onTap: (){
                                qua+=1;
                                setState(() {
                                  quantity=qua;
                                });
                              },
                              child:
                              Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
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
                                alignment: Alignment.center,child: const Text("+"),)),
                        ],
                      ),
                    ),
                  ],
                )
              ],),
          ),
        );
      },
    );
  }
}
