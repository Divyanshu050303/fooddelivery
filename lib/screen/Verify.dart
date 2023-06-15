import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../NavBar.dart';
import 'SignIn.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  late VideoPlayerController _videoPlayerController;
  final ScrollController _scrollController = ScrollController();
  final FirebaseAuth auth=FirebaseAuth.instance;

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
    MediaQueryData mediaQueryData=MediaQuery.of(context);
    String code="";
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
            child: Column(
              children: [
                SizedBox(height:mediaQueryData.size.height*0.4 ,),
                const Text("Verification Code", style: TextStyle(fontSize: 30, ),textAlign: TextAlign.left,),
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: Form(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 54,
                        width: 50,
                        child: TextField(
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                          ),

                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,

                        ),
                      ),SizedBox(
                        height: 54,
                        width: 50,
                        child: TextField(
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                        ),
                      ),SizedBox(
                        height: 54,
                        width: 50,
                        child: TextField(
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                        ),
                      ),SizedBox(
                        height: 54,
                        width: 50,
                        child: TextField(
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                        ),
                      ),SizedBox(
                        height: 54,
                        width: 50,
                        child: TextField(
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                        ),
                      ),SizedBox(
                        height: 54,
                        width: 50,
                        child: TextField(
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 2)
                            ),
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          cursorColor: Colors.black,
                        ),
                      ),
                    ],)),
                ),
                SizedBox(height: mediaQueryData.size.height*0.05,),
                ElevatedButton(onPressed: () async{
                  try {
                    PhoneAuthCredential credential = PhoneAuthProvider
                        .credential(
                        verificationId: SignIn.verify, smsCode: code);
                    await auth.signInWithCredential(credential);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const NavBar()));
                  }
                  catch(e){

                  }
                }, child: const Text("Verify",style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
