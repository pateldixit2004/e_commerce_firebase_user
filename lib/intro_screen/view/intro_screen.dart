import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(title: '',body: 'We provide high quality products just for you',image:Image.asset('assets/image/i1.png') ),
          PageViewModel(title: '',body: 'your satisfaction is our number one priority',image:Image.asset('assets/image/i2.png') ),
          PageViewModel(title: '',body: 'Let’s fulfil your daily needs with us',image:Image.asset('assets/image/i3.png') ),
        ],
        showNextButton: true,
        showSkipButton: true,
        showDoneButton: true,
        done: Text("Get Started",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        skip: Text("Skip",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        next: Text("Next",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        onDone: () {
          Get.offAllNamed('/login');
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(50.0, 10.0),
          // activeColor: Theme.of(context).colorScheme.secondary,
          // activeColor: Color(0xff9F57F9),
          // color: Color(0xff9F57F9),
          activeColor: Colors.lightGreen,
          color: Colors.green,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          ),
        ),

      ),

    ),);
  }
}
