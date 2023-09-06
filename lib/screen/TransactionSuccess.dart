import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/util/ItemCard.dart';

class TransactionSuccess extends StatefulWidget {
  List<Map<String, dynamic>> itemDetails;
  String addressName, allAddress;
    TransactionSuccess({super.key, required this.itemDetails, required this.addressName, required this.allAddress});

  @override
  State<TransactionSuccess> createState() => _TransactionSuccessState();
}

class _TransactionSuccessState extends State<TransactionSuccess>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _textAnimationController;
  late Animation<double> _textAnimation;
  String _text = "Have A Nice Day";
  final databaseref= FirebaseDatabase.instance.ref("Orders");
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat(reverse: true);
    _textAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _textAnimationController, curve: Curves.easeInOut));
    _textAnimationController.repeat(reverse: true);

    // backend order address and item
   Map<String, dynamic> orderSummary={
     "AddressName":widget.addressName,
     "AddressDetails":widget.allAddress,
     "ItemDetails":widget.itemDetails
   };
    final uniqueKey=databaseReference.child("orders").child(FirebaseAuth.instance.currentUser!.uid).push().key;
    databaseref.child(uniqueKey!).set(orderSummary);
    datalist.clear();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Stack(
      children: [
        Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: mediaQueryData.size.height * 0.85,
                left: mediaQueryData.size.width * 0.01),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>  HomePage()), (route) => false);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: mediaQueryData.size.width * 0.01,
                ),
                const Text(
                  "Success",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                height: mediaQueryData.size.height * 0.9,
                color: Colors.cyan.shade50,
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQueryData.size.height * 0.07,
                    ),
                    SizedBox(
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height * 0.5,
                      child: Column(
                        children: [
                          AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _animation.value,
                                  child: const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.green,
                                    size: 100,
                                  ),
                                );
                              }),
                          SizedBox(
                            height: mediaQueryData.size.height * 0.01,
                          ),
                          const Text(
                            "Thankyou for Order",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                decoration: TextDecoration.none),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: mediaQueryData.size.width * 0.12,
                                right: mediaQueryData.size.width * 0.102,
                                top: 30),
                            child: Column(
                              children: [
                                const Text(
                                  "Your order will be delivered in 45 minute. Enjoy!",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      decoration: TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AnimatedBuilder(
                                    animation: _textAnimation,
                                    builder: (context, child) {
                                      return Opacity(
                                          opacity: _textAnimation.value,
                                          child: Text(_text,
                                              style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 20,
                                                  decoration:
                                                      TextDecoration.none)));
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
