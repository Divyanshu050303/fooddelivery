import 'package:flutter/material.dart';

import '../util/ItemCard.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
  _scrollController.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            height: mediaQueryData.size.height*0.73,
            width: mediaQueryData.size.width,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.white, Colors.cyan],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: mediaQueryData.size.width>900?3:2,
                  mainAxisSpacing: mediaQueryData.size.width * 0.09,
                  childAspectRatio: 0.8
                ),
                itemCount: ItemList.length,
                itemBuilder: (context, index) {
                  int qua=int.parse(ItemList[index]['quantity']);
                  return Padding(
                      padding: EdgeInsets.only(
                          left: mediaQueryData.size.width * 0.045,
                          right: mediaQueryData.size.width * 0.045),
                      child: GridTile(
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
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 3))
                          ],
                        ),
                        child: ListView(
                          controller: _scrollController,
                          children:[ Column(
                            children: [
                              Image.asset(
                                ItemList[index]['image'],
                                width: 150,
                                height: 101,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        qua-=1;
                                        setState(() {
                                          ItemList[index]['quantity']=qua.toString();
                                          if(qua.toString()=="0"){
                                            ItemList.removeAt(index);
                                          }
                                        });
                                      },
                                  child:Container(
                                    width: 40,
                                    height: 20.5,
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
                                      height: 20.5,
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
                                      child:  Text(ItemList[index]['quantity'])),
                                  GestureDetector(
                                    onTap: (){
                                      qua+=1;
                                      setState(() {
                                        ItemList[index]['quantity']=qua.toString();
                                      });
                                    },
                                    child:
                                  Container(
                                      width: 40,
                                      height: 20.5,
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
                              IconButton(onPressed: (){
                                setState(() {
                                  ItemList.removeAt(index);
                                });
                              }, icon: const Icon(Icons.delete_forever_rounded ,color: Colors.black,))
                            ],
                          ),
                        ]),
                      )));
                }),

          ),
        ),
        Padding(
          padding:   EdgeInsets.only(bottom: mediaQueryData.size.height*0.072),
          child: Container(width: mediaQueryData.size.width,height: mediaQueryData.size.height*0.088,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.cyan])
              ),
              child: Padding(
                padding: const EdgeInsets.only(  left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [BoxShadow(
                            color: Colors.black,
                            blurRadius: 3,
                            spreadRadius: 2,
                            offset: Offset(0,3),
                          )
                          ],
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 1
                          )
                      ),
                      width: 80,
                      height: 40,
                      // color: Colors.white,
                      // alignment: Alignment.bottomLeft,
                      child: Text("Time",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.yellowAccent,
                              Colors.yellowAccent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [BoxShadow(
                            color: Colors.black,
                            blurRadius: 3,
                            spreadRadius: 2,
                            offset: Offset(0,3),
                          )
                          ],
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 1
                          )
                      ),
                      width: 120,
                      height: 40,
                      // color: Colors.white,
                      // alignment: Alignment.bottomLeft,
                      child:     const Text("buy",textAlign: TextAlign.center, style: TextStyle(fontSize: 20,)),
                    ),
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
}
