import 'package:e_commerce_firebase_user/screen/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    controller.indexBottom.value = 0;
                  },
                  icon: Icon(Icons.home_outlined)),
              IconButton(
                  onPressed: () {
                    controller.indexBottom.value = 1;
                  },
                  icon: Icon(Icons.search)),
            ],
          ),
        ),
        body: controller.screenList[controller.indexBottom.value],
      ),
    );
  }
}
