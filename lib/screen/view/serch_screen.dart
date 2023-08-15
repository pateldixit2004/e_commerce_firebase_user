import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:e_commerce_firebase_user/screen/controller/serch_controller.dart';
import 'package:e_commerce_firebase_user/screen/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  // SerchController controller = Get.put(SerchController());
  screenController controller = Get.put(screenController());
  UserController con = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    print("=========================================$value");
                    controller.serchProduct(value);


                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: Icon(Icons.search_rounded)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Obx(() => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 200,
                          childAspectRatio: 100),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed('/prode', arguments: index);
                              },
                              child: Container(
                                height: 20.h,
                                width: 35.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: Colors.grey.shade300,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Image.asset("${list[index].img}",height: 10.h,),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    controller.list[index].img!.isEmpty
                                        ? Image.network(
                                            "https://m.media-amazon.com/images/I/41ATdIgTJLL.jpg",
                                            height: 10.h,
                                          )
                                        : Image.network(
                                            "${controller.list[index].img}",
                                            height: 10.h,
                                          ),
                                    Text(
                                      '${controller.list[index].name}',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text('₹  ${controller.list[index].price}'),
                                    // SizedBox(
                                    //   height: 1.h,
                                    // ),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //       borderRadius: BorderRadius.circular(10)),
                                    //   child: Text(
                                    //     '  ${controller.recommenedList[index].rat} ⭐',
                                    //     style: TextStyle(color: Colors.green),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: controller.list.length),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
