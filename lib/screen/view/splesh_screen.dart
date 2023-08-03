import 'dart:async';

import 'package:e_commerce_firebase_user/intro_screen/controller/intro_controller.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  bool isLogin=false;
  IntroController controller=Get.put(IntroController());
  
  @override
  void initState() {
    super.initState();
    isLogin=FireBaseHelper.base.checkUser();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      // isLogin==false?Get.toNamed('/home'):
      Get.toNamed(isLogin==true?'/home':'/login');
      // Get.toNamed('/intro');
    });
    return SafeArea(child: Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/image/img_2.png")),
          ),
        ),
      ),
    ),);
  }
}
