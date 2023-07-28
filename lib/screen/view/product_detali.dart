import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  screenController controller = Get.put(screenController());
  @override
  void initState() {
    super.initState();
    Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Image.asset('${controller.recommenedList[0].img}')
        ],
      ),
    ),);
  }
}
