import 'package:flutter/material.dart';
import 'package:fooddelivery/NavBar.dart';
import 'package:fooddelivery/screen/Payment.dart';
import 'package:fooddelivery/screen/SelectedAddress.dart';

class OrderSummary extends StatefulWidget {
  String image, name, quantity, price;

  OrderSummary(
      {super.key,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price});

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
      color: Colors.blue,
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: mediaQueryData.size.height * 0.9,
              width: mediaQueryData.size.width,

              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0, 3)),
                ],
              ),
              // color: Colors.black26,
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: mediaQueryData.size.height * 0.75),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavBar(count: 0)), (route) => false);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 27,
                        )),
                    const Text(
                      "Order Summary",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: mediaQueryData.size.height * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: mediaQueryData.size.height * 0.85,
                  width: mediaQueryData.size.width,

                      color: Colors.cyan.shade50,

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
                                        builder: (context) =>
                                            const SelectAddress()));
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
              ),
            ),
            Positioned(
              top: mediaQueryData.size.height * 0.33,
              child: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                    border: Border(top: BorderSide(color: Colors.black,width: 0.3))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Colors.black45)
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
                                left: mediaQueryData.size.width * 0.1,
                                top: 30.0),
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
                                left: mediaQueryData.size.width * 0.08,
                                top: 10.0),
                            child: Text(
                              widget.quantity,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 19.0, top: 10),
                            child: Row(
                              children: [
                                const Text(
                                  "5% off ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                                TextWithLine(),
                                const Text(
                                  "\u20B9189",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top:mediaQueryData.size.height*0.53,child:
            Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height * 0.24,

                decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                  border: Border(top: BorderSide(color: Colors.black,width: 0.3))
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 160.0, top: 10),
                      child: Text(
                        "Price Details",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          const Text(
                            "Price (3 item)",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.4,
                          ),
                            Text(
                            "\u20B9${widget.price}",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          const Text(
                            "Discount",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.53,
                          ),
                          const Text(
                            "-\u20B90",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          const Text(
                            "Delivery",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.33,
                          ),
                          const Text(
                            "Free Delivery",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: LineWidget(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.65,
                          ),
                            Text(
                            "\u20B9${widget.price}",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    )
                  ],
                )),)

          ]),

          Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height * 0.0997,
            decoration: BoxDecoration(
                color: Colors.cyan.shade50,
                border:
                Border(top: BorderSide(color: Colors.black, width: 0.5))),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQueryData.size.width * 0.07,
                  ),
                    Text(
                    "\u20B9${widget.price}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.4,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment(name: widget.name, image: widget.image, quantity: widget.quantity, price: widget.price)));
                    },
                    child: Container(
                      width: mediaQueryData.size.width * 0.33,
                      height: mediaQueryData.size.height * 0.07,

                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                    ),
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

class TextWithLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Text(
          '\u20B9199 ',
          style: TextStyle(
              fontSize: 14.0,
              decoration: TextDecoration.none,
              color: Colors.black),
        ),
        Positioned(
          top: 8,
          left: -1,
          right: 9,
          child: Container(
            height: 1.5,
            color: Colors.black, // Customize the line color
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
    final endPoint =
        Offset(size.width, size.height / 2); // Ending point of the line

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
