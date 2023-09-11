import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/util/ItemCardWithCornerBanner.dart';

import '../Services/JsonData.dart';
import '../util/ItemCard.dart';
import 'MoreItem.dart';
import 'Search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
late bool owner;
class _HomeScreenState extends State<HomeScreen> {
  final String _sale = "";

@override
  void initState() {
    // TODO: implement initState
 owner = FirebaseAuth.instance.currentUser?.email ==
      "divyanshusingh6747@gmail.com" ||
      FirebaseAuth.instance.currentUser?.phoneNumber == "7451047019"
      ? true
      : false;
 print(owner);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);


    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 70),
          color: Colors.black,
          child: Stack(children: [
            Container(
              height: mediaQueryData.size.height * 0.92,
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
                padding: EdgeInsets.only(
                    bottom: mediaQueryData.size.height * 0.77, left: 30),
                child: const Row(
                  children: [
                    Text(
                      "Yummy Delight",
                      style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontWeight: FontWeight.normal,
                          fontSize: 24,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: mediaQueryData.size.height * 0.9,
                  width: mediaQueryData.size.width,
                  color: Colors.cyan.shade50,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 85.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "South Indian",
                                style: TextStyle(fontSize: 30, fontFamily: 'Roboto-Regular',  fontWeight: FontWeight.normal,),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? ItemCardWithCornerBanner(
                                        name: "Masala Dosa",
                                        image: "assets/masalaDosa.png",
                                        price: "60",
                                        quantity: '1',
                                        Sale: _sale,
                                      )
                                    : const ItemCard(
                                        name: "Masala Dosa",
                                        image: "assets/masalaDosa.png",
                                        price: "60",
                                        quantity: '1',
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? ItemCardWithCornerBanner(
                                        name: "Butter Dosa",
                                        image: "assets/butterdosa.png",
                                        price: "100",
                                        quantity: "1",
                                        Sale: _sale,
                                      )
                                    : const ItemCard(
                                        name: "Butter Dosa",
                                        image: "assets/butterdosa.png",
                                        price: "100",
                                        quantity: "1",
                                      )
                              ],
                            ),
                            SizedBox(
                              height: mediaQueryData.size.height * 0.04,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? ItemCardWithCornerBanner(
                                        name: "Idli Fry",
                                        image: "assets/idlifry.png",
                                        price: "70",
                                        quantity: "1",
                                        Sale: _sale,
                                      )
                                    : const ItemCard(
                                        name: "Idli Fry",
                                        image: "assets/idlifry.png",
                                        price: "70",
                                        quantity: "1",
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Idli Sambar",
                                        image: "assets/idli.png",
                                        price: "60",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Idli Sambar",
                                        image: "assets/idli.png",
                                        price: "60",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 3, top: 12),
                              child: Text(
                                "Soft Drink",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Sprite ",
                                        image: "assets/Sptite.png",
                                        price: "45",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Sprite ",
                                        image: "assets/Sptite.png",
                                        price: "45",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Thums up",
                                        image: "assets/thumsup.png",
                                        price: "45",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Thums up",
                                        image: "assets/thumsup.png",
                                        price: "45",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: mediaQueryData.size.height * 0.05,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Coke",
                                        image: "assets/coke.png",
                                        price: "45",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Coke",
                                        image: "assets/coke.png",
                                        price: "45",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "limca",
                                        image: "assets/limca.png",
                                        price: "95",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "limca",
                                        image: "assets/limca.png",
                                        price: "95",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 3, top: 12),
                              child: Text(
                                "Cake",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "ButterScotch",
                                        image: "assets/buttersc.png",
                                        price: "400",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "ButterScotch",
                                        image: "assets/buttersc.png",
                                        price: "400",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Pineapple",
                                        image: "assets/pineapple.png",
                                        price: "400",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Pineapple",
                                        image: "assets/pineapple.png",
                                        price: "400",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: mediaQueryData.size.height * 0.05,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Strawberry",
                                        image: "assets/strawberry.png",
                                        price: "700",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Strawberry",
                                        image: "assets/strawberry.png",
                                        price: "700",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Pihu ",
                                        image: "assets/pihu.png",
                                        price: "700",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Pihu ",
                                        image: "assets/pihu.png",
                                        price: "700",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 10,
                                    left: mediaQueryData.size.width * 0.74),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MoreItem()));
                                    },
                                    child: const Text(
                                      "Show More",
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration: TextDecoration.underline,
                                          color: Colors.purple),
                                    ))),
                            const Padding(
                              padding: EdgeInsets.only(left: 3, top: 12),
                              child: Text(
                                "Momo's",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Fry Paneer Momo's",
                                        image: "assets/frymomo.png",
                                        price: "80",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Fry Paneer Momo's",
                                        image: "assets/frymomo.png",
                                        price: "80",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Momo's",
                                        image: "assets/momo.png",
                                        price: "50",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Momo's",
                                        image: "assets/momo.png",
                                        price: "50",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: mediaQueryData.size.height * 0.05,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.059,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Paneer momo's steam",
                                        image: "assets/pneermomos.png",
                                        price: "70",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Paneer momo's steam",
                                        image: "assets/pneermomos.png",
                                        price: "70",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                                SizedBox(
                                  width: mediaQueryData.size.width * 0.06,
                                ),
                                _sale.isNotEmpty
                                    ? const ItemCard(
                                        name: "Fry momos",
                                        image: "assets/frymomo.png",
                                        price: "50",
                                        quantity: "1",
                                      )
                                    : ItemCardWithCornerBanner(
                                        name: "Fry momos",
                                        image: "assets/frymomo.png",
                                        price: "50",
                                        quantity: "1",
                                        Sale: _sale,
                                      ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ])),
    ));
  }
}
