import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/ItemCard.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
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
                  height: 300,
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
                  child: Column(
                    children: [
                      Image.asset(
                        ItemList[index]['image'],
                        width: 150,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        ItemList[index]['name'],
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        ItemList[index]['price'],
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 40,
                            height: 20,
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
                            alignment: Alignment.center,
                            child:const Text("-", style: TextStyle(fontSize: 20),),

                          ),
                          Container(
                              width: 40,
                              height: 20,
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
                              alignment: Alignment.center,
                              child:  Text(ItemList[index]['quantity'])),
                          GestureDetector(
                            onTap: (){
                              ItemList[index]['quantity']=(int.parse(ItemList[index]['quantity'])+1).toString();
                              print(ItemList[index]['quantity']);
                            },
                            child:

                          Container(
                              width: 40,
                              height: 20,
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
                              alignment: Alignment.center,child: const Text("+"),)),
                        ],

                      ),

                    ],
                  ),
                )));
          }),
    );
  }
}
