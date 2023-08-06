import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../NavBar.dart';
import '../Services/SigningClass.dart';
import 'Verify.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String verify="";
  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  late VideoPlayerController _videoPlayerController;
  final ScrollController _scrollController = ScrollController();
  String _phoneNumber = "";
  TextEditingController countryController = TextEditingController();
bool result=false;
  Future checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        result = false;
      });
    } else {
      setState(() {
        result = true;
      });
    }
  }

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/yummydelight.mp4');
    _videoPlayerController.initialize().then((_) {
      setState(() {});
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);
    });
    checkInternetConnectivity();

    if(result){
        AlertDialog(
        title: const Text("Network Error"),
        content: const Text("Please Check you Internet Connection"),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
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
                        style: TextStyle(color: Colors.black,
                          fontFamily: 'Roboto-Regular',),
                      ),
                      focusColor: Colors.black,
                    ),
                    onChanged: (value){
                      _phoneNumber=value;
                    }
                    ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                      onPressed: () async{
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber:countryController.text+_phoneNumber,
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            SignIn.verify=verificationId;
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Verify()));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );

                      },
                      child: const Text("Send Code")),
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                         final provider=Provider.of<SingingAuth>(context, listen: false);
                         provider.googleLogin();
                         if(provider.isSigningIn){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavBar(count: 0,)), (route) => false);
                         }
                      },
                      child: Image.asset(
                        "assets/google.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // final provider =Provider.of<SingingAuth>(context, listen: false);
                        // provider.FacebookLogin();
                      },
                      child: Image.asset(
                        "assets/facebook.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _scrollTop() {
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    // _Shift = true;
  }
}