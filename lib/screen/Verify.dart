import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
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
    MediaQueryData mediaQueryData=MediaQuery.of(context);
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
                ElevatedButton(onPressed: (){}, child: const Text("Verify",style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
