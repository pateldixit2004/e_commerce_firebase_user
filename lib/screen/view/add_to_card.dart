import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCardScreen extends StatefulWidget {
  const AddToCardScreen({Key? key}) : super(key: key);

  @override
  State<AddToCardScreen> createState() => _AddToCardScreenState();
}

class _AddToCardScreenState extends State<AddToCardScreen> {
  screenController controller=Get.put(screenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset("${controller.addtocardList[index].img}"),
          title: Text("${controller.addtocardList[index].name}"),
          subtitle: Text("${controller.addtocardList[index].price}"),
        );
      },itemCount: controller.addtocardList.length,)
    ),);
  }
}
