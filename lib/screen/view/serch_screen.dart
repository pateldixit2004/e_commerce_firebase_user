import 'package:e_commerce_firebase_user/screen/controller/serch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  SerchController controller=Get.put(SerchController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(20),),
                suffixIcon: Icon(Icons.search_rounded)
              ),
            ),
            SizedBox(height: 15,),


            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 200,childAspectRatio: 100),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 20.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp),
                            color: Colors.grey.shade300,

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 10,),
                              Image.asset("${controller.serchList[index].img}",height: 10.h,),
                              SizedBox(height: 10,),
                              Text(
                                '${controller.serchList[index].name}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text('₹  ${controller.serchList[index].price}'),
                              // SizedBox(
                              //   height: 1.h,
                              // ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: Text(
                              //     '  ${controller.serchList[index].rat} ⭐',
                              //     style: TextStyle(color: Colors.green),
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                      ],
                    );
                  },
                  itemCount: controller.serchList.length),
            ),
          ],
        ),
      ),
    ),);
  }
}
