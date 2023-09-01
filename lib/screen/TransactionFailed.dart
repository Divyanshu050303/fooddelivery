import 'package:flutter/material.dart';

class TransactionFailed extends StatefulWidget {
  const TransactionFailed({super.key});

  @override
  State<TransactionFailed> createState() => _TransactionFailedState();
}

class _TransactionFailedState extends State<TransactionFailed> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: mediaQueryData.size.width * 0.01,
                ),
                const Text(
                  "Payment Confirmation",
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
                      width: mediaQueryData.size.width,
                      height: mediaQueryData.size.height*0.8,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: _animation.value,
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: 100,
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: mediaQueryData.size.height * 0.01,
                            ),
                            const Text(
                              "Transaction Fail!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  decoration: TextDecoration.none),
                            ),
                            Text("Try Again", style: TextStyle(color: Colors.grey, decoration: TextDecoration.none, fontSize: 20),)

                          ],
                        ),
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
