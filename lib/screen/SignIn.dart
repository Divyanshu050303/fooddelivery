import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/SignUp.dart';
import 'package:video_player/video_player.dart';

import 'Verify.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late VideoPlayerController _videoPlayerController;
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/yummydelight.mp4');
    _videoPlayerController.initialize().then((_) {
      setState(() {});
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : Container(),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: mediaQueryData.size.height * .4,
                      left: mediaQueryData.size.width * 0.08,
                      right: mediaQueryData.size.width * 0.08),
                  child: TextField(
                    onTap: () {
                      _scrollTop();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      hintText: "Phone Number",
                      label: const Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Verify()));
                      },
                      child: const Text("Send Code")),
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/google.png",
                      width: 40,
                      height: 40,
                    ),
                    Image.asset(
                      "assets/facebook.png",
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQueryData.size.height * 0.05,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 25,
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _scrollTop() {
    _scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    // _Shift = true;
  }
}
