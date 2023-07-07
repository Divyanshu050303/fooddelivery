import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:fooddelivery/screen/Payment.dart';
import 'package:fooddelivery/screen/SelectedAddress.dart';

import '../util/Rating.dart';

class OrderSummary extends StatefulWidget {
  String image, name, quantity;

  OrderSummary(
      {super.key,
      required this.image,
      required this.name,
      required this.quantity});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
            height: mediaQueryData.size.height * 0.1,
            width: mediaQueryData.size.width,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              boxShadow: [
                BoxShadow(spreadRadius: 2, color: Colors.black, blurRadius: 2)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 27,
                      )),
                  const Text(
                    "Order Summary",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQueryData.size.height * 0.02,
          ),
          Container(
            height: mediaQueryData.size.height * 0.2,
            width: mediaQueryData.size.width,
            decoration: const BoxDecoration(color: Colors.grey, boxShadow: [
              BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.white)
            ]),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      const Text(
                        "delivered to:",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        width: mediaQueryData.size.width * 0.4,
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SelectAddress()));
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Change",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: mediaQueryData.size.height * 0.02,
          ),
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.2,
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 2, spreadRadius: 2, color: Colors.black45)
                    ]),
                    child: Image.asset(
                      widget.image,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: mediaQueryData.size.width * 0.1, top: 30.0),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: mediaQueryData.size.width * 0.08, top: 10.0),
                        child:Text(
                        widget.quantity,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),),
                        Padding(
                        padding: EdgeInsets.only(left: 19.0,top: 10),
                        child: Row(
                          children: [
                            const Text(
                              "5% off ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.yellow,
                                  decoration: TextDecoration.none),
                            ),
                            TextWithLine(),
                            const Text(
                              "\u20B9189",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.yellow,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 19.0),
                      //   child:Row(
                      //   children: [
                      //     RatingWidget(),
                      //     const Text("(256)",style: TextStyle(fontSize: 12, color: Colors.black, decoration: TextDecoration.none),)
                      //   ],
                      // ))
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: mediaQueryData.size.height*0.02,),
          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.24,
            color: Colors.blueAccent,
            child:   Column(
              children: [
               const Padding(
                 padding: EdgeInsets.only(right: 160.0, top: 10),
                 child: Text("Price Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.none, color: Colors.black),),
               ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Row(
                    children: [
                      const Text("Price (3 item)", style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(width:mediaQueryData.size.width*0.4 ,),
                      const Text("\u20B9456", style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Row(
                    children: [
                      const Text("Discount", style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(width:mediaQueryData.size.width*0.53 ,),
                      const Text("-\u20B9456", style: TextStyle(fontSize: 16, color: Colors.green, decoration: TextDecoration.none),)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Row(
                    children: [
                      const Text("Delivery", style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(width:mediaQueryData.size.width*0.33 ,),
                      const Text("Free Delivery", style: TextStyle(fontSize: 16, color: Colors.green, decoration: TextDecoration.none),)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(child: LineWidget(),),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Row(
                    children: [
                      const Text("Total", style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(width:mediaQueryData.size.width*0.65 ,),
                      const Text("\u20B9345", style: TextStyle(fontSize: 16, color: Colors.green, decoration: TextDecoration.none),)
                    ],
                  ),
                )
              ],
            )),
          SizedBox(height: mediaQueryData.size.height*0.1052,),
          Container(alignment: Alignment.bottomCenter,height: mediaQueryData.size.width*0.2,width: mediaQueryData.size.width,color: Colors.black,
          child:   Padding(
            padding: EdgeInsets.only(bottom:  25.0,left: 27),
            child: Row(
              children: [
                const Text("\u20B9236", style: TextStyle(fontSize: 16, color: Colors.white, decoration: TextDecoration.none)),
                SizedBox(width: mediaQueryData.size.width*0.5,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.none),
                    ),
                  ),
                )

              ],
            ),
          ),)

        ],
      ),
    );
  }
}
class TextWithLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Text(
          '\u20B9199 ',
          style: TextStyle(fontSize: 14.0,decoration: TextDecoration.none,color: Colors.yellow),
        ),
        Positioned(
          top: 8,
          left: -1,
          right: 9,

          child: Container(
            height: 1.5,
            color: Colors.yellow, // Customize the line color
          ),
        ),
      ],
    );
  }
}


class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Customize the line color
      ..strokeWidth = 2.0; // Customize the line thickness

    final startPoint = Offset(0, size.height / 2); // Starting point of the line
    final endPoint = Offset(size.width, size.height / 2); // Ending point of the line

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      size: const Size(double.infinity, 1.0), // Customize the line height
    );
  }
}
