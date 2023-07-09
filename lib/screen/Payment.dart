import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/screen/orderSummary.dart';

class Payment extends StatefulWidget {
  String image, name, quantity, price;

  Payment(
      {super.key,
      required this.name,
      required this.image,
      required this.quantity,
      required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? selectedOption = "Google Pay";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      color: Colors.blue,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height * 0.9,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 3)),
                    ],
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: mediaQueryData.size.height * 0.75),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderSummary(
                                          image: widget.image,
                                          name: widget.name,
                                          quantity: widget.quantity,
                                          price: widget.price,
                                        )),
                                (route) => false);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const Text(
                        "Payment",
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
                top: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Scaffold(
                        body: Container(
                          decoration: BoxDecoration(
                            color: Colors.cyan.shade50,
                            // borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: mediaQueryData.size.width * 0.4,
                                      top: 12),
                                  child: const Text(
                                    "Payment Option",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black),
                                  ),
                                ),
                                RadioListTile(
                                  title: const Text('Phone Pay'),
                                  secondary: Image.asset(
                                    "assets/phonepay.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  value: 'Phone Pay',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Paytm'),
                                  value: 'Paytm',
                                  groupValue: selectedOption,
                                  secondary: Image.asset(
                                    "assets/paytm.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text("Google Pay"),
                                  value: 'Google Pay',
                                  groupValue: selectedOption,
                                  selectedTileColor: Colors.red,
                                  secondary: Image.asset(
                                    'assets/google.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title: const Text('Cash on Delivery'),
                                  value: 'Cash on Delivery',
                                  groupValue: selectedOption,
                                  secondary: Image.asset(
                                    'assets/cash.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                  onChanged: (value) {
                                    print("Cash on Delivery");
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                top: mediaQueryData.size.height * 0.52,
                child: Container(
                  width: mediaQueryData.size.width,
                  height: mediaQueryData.size.height * 0.2,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              right: mediaQueryData.size.width * 0.4),
                          child: const Text(
                            "Price Details",
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 10, top: 10),
                        child: Container(
                          width: mediaQueryData.size.width,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black, width: 0.3))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: mediaQueryData.size.width * 0.055,
                                    ),
                                    const Text(
                                      "Price (1 Item)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: mediaQueryData.size.width * 0.355,
                                    ),
                                      Text("\u20B9${widget.price}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: mediaQueryData.size.width * 0.055,
                                    ),
                                    const Text(
                                      "Delivery Charges",
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: mediaQueryData.size.width * 0.3,
                                    ),
                                    const Text("Free",
                                        style: TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            color: Colors.green)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 10, top: 10),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 0.3))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryData.size.width * 0.055,
                                  ),
                                  const Text(
                                    "Amount Payable",
                                    style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: mediaQueryData.size.width * 0.355,
                                  ),
                                    Text("\u20B9${widget.price}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
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
                  Container(
                    width: mediaQueryData.size.width * 0.33,
                    height: mediaQueryData.size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    ),
                    child: const Center(
                        child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    )),
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
