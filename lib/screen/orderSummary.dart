import 'package:flutter/material.dart';
import 'package:fooddelivery/NavBar.dart';
import 'package:fooddelivery/screen/Payment.dart';
import 'package:fooddelivery/screen/SelectedAddress.dart';
import 'package:fooddelivery/util/ItemCard.dart';

class OrderSummary extends StatefulWidget {
  List<Map<String, dynamic>>itemDetailsList;
  OrderSummary(
      {super.key,
      required  this.itemDetailsList });
  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}
String addressName="";
String allAddress="";

class _OrderSummaryState extends State<OrderSummary> {
  int totalPrice=0;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<widget.itemDetailsList.length;i++){
      totalPrice+=int.parse(widget.itemDetailsList[i]["price"]);
    }
  }
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
                          fontFamily: 'Roboto-Regular',
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
                        padding: const EdgeInsets.only(left: 9),
                        child: Row(
                          children: [
                            const Text(
                              "Delivered to:",
                              style: TextStyle(
                                  fontSize: 21,

                                  fontFamily: 'Roboto-Regular',
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                            SizedBox(
                              width: mediaQueryData.size.width * 0.36,
                              height: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                              SelectAddress(dataListItemDetails: datalist,)));
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
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left:25.0),
                          child: Row(
                          children: [
                            Text(addressName, style: const TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.black),),
                          ],
                      ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:25, top: 7),
                          child: Row(
                          children: [
                            Text(allAddress, style: const TextStyle(fontSize: 14, decoration: TextDecoration.none, color: Colors.black),),
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
                height: mediaQueryData.size.height * 0.4,
                decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                    border: const Border(top: BorderSide(color: Colors.black,width: 0.3))
                ),
                child: GridView.builder(
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: widget.itemDetailsList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          children: [
                            Stack(
                              children:[
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
                                      widget.itemDetailsList[index]["image"],
                                      width: 50,
                                      height: 50,
                                    ),

                                ),
                        ]
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: mediaQueryData.size.width * 0.1,
                                      ),
                                  child: Text(
                                    widget.itemDetailsList[index]["name"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'Roboto-Regular',
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: mediaQueryData.size.width * 0.08,
                                      top: 10.0),
                                  child: Text(
                                    widget.itemDetailsList[index]["quantity"],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 19.0, top: 10),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "5% off ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: 'Roboto-Regular',
                                            decoration: TextDecoration.none),
                                      ),
                                      TextWithLine(),
                                        Text(
                                        "\u20B9${widget.itemDetailsList[index]["price"]}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: 'Roboto-Regular',
                                            decoration: TextDecoration.none),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                ),
              ),
            ),
            Positioned(
              top:mediaQueryData.size.height*0.64,child:
            Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height * 0.24,

                decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                  border: const Border(top: BorderSide(color: Colors.black,width: 0.3))
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 193.0, top: 10),
                      child: Text(
                        "Price Details",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Regular',
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Row(
                        children: [
                          const Text(
                            "Price (3 item)",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Roboto-Regular',
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.4,
                          ),
                            Text(
                            "\u20B9$totalPrice",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Roboto-Regular',
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
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Roboto-Regular',
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.53,
                          ),
                          const Text(
                            "-\u20B90",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontFamily: 'Roboto-Regular',
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
                                fontFamily: 'Roboto-Regular',
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.35,
                          ),
                          const Text(
                            "Free Delivery",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontFamily: 'Roboto-Regular',
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LineWidget(),
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
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'Roboto-Regular',
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            width: mediaQueryData.size.width * 0.60,
                          ),
                            Text(
                            "\u20B9$totalPrice",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontFamily: 'Roboto-Regular',
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
                const Border(top: BorderSide(color: Colors.black, width: 0.5))),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: mediaQueryData.size.width * 0.07,
                  ),
                    Text(
                    "\u20B9$totalPrice",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Roboto-Regular',
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    width: mediaQueryData.size.width * 0.4,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment(price: totalPrice,allAddress: allAddress, addressName: addressName,itemDetails: datalist,)));
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
                                fontFamily: 'Roboto-Regular',
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
