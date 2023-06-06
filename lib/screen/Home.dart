import 'package:flutter/material.dart';

import '../util/ItemCard.dart';
import 'MoreItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 70),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.cyan, Colors.white, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                "South Indian",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: mediaQueryData.size.width * 0.059,
                ),
                 const ItemCard(name: "Masala Dosa",image: "assets/masalaDosa.png",price:"60", quantity: '1',),
                SizedBox(
                  width: mediaQueryData.size.width * 0.06,
                ),
                const ItemCard(name: "Butter Dosa",image: "assets/butterdosa.png",price:"100", quantity: "1",),
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
                const ItemCard(name: "Idli Fry",image: "assets/idlifry.png",price:"70", quantity: "1",),
                SizedBox(
                  width: mediaQueryData.size.width * 0.06,
                ),
                const ItemCard(name: "Idli Sambar",image: "assets/idli.png",price:"60", quantity: "1",),
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
                const ItemCard(name: "Sprite ",image: "assets/Sptite.png",price:"45", quantity: "1",),
                SizedBox(
                  width: mediaQueryData.size.width * 0.06,
                ),
                const ItemCard(name: "Thums up",image: "assets/thumsup.png",price:"45", quantity: "1",),
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
                const ItemCard(name: "Coke",image: "assets/coke.png",price:"45", quantity: "1",),
                SizedBox(
                  width: mediaQueryData.size.width * 0.06,
                ),
                const ItemCard(name: "limca",image: "assets/limca.png",price:"95", quantity: "1",),
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
                const ItemCard(name: "ButterScotch",image: "assets/buttersc.png",price:"400", quantity: "1",),
                SizedBox(
                  width: mediaQueryData.size.width * 0.06,
                ),
                const ItemCard(name: "Pineapple",image: "assets/pineapple.png",price:"400", quantity: "1",),
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
                const ItemCard(name: "Strawberry",image: "assets/strawberry.png",price:"700", quantity: "1",),
                SizedBox(
                  width: mediaQueryData.size.width * 0.06,
                ),
                const ItemCard(name: "Pihu ",image: "assets/pihu.png",price:"700", quantity: "1",),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: 10, left: mediaQueryData.size.width * 0.74),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MoreItem()));
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
                    const ItemCard(name: "Fry Paneer Momo's",image: "assets/frymomo.png",price:"80", quantity: "1",),
                    SizedBox(
                      width: mediaQueryData.size.width * 0.06,
                    ),
                    const ItemCard(name: "Momo's",image: "assets/momo.png",price:"50", quantity: "1",),
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
                    const ItemCard(name: "Paneer momo's steam",image: "assets/pneermomos.png",price:"70", quantity: "1",),
                    SizedBox(
                      width: mediaQueryData.size.width * 0.06,
                    ),
          const ItemCard(name: "Fry momos",image: "assets/frymomo.png",price:"50", quantity: "1",),
                  ],
                ),
          ])),
    ));
  }
}
