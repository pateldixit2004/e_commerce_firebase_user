import 'package:e_commerce_firebase_user/screen/controller/userController.dart';
import 'package:e_commerce_firebase_user/screen/model/screen_model.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class BuyNowScreen extends StatefulWidget {
  const BuyNowScreen({Key? key}) : super(key: key);

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  UserController controller = Get.put(UserController());
  productModel? model;

  @override
  void initState() {
    super.initState();
    controller.userdata.value = FireBaseHelper.base.userData();
    model=Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('cancel'))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Text('Billing Address',style: TextStyle(color: Colors.black),),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 45.w,
                        child: buildTextField('First name', TextInputType.text)),
                    Container(
                        height: 40,
                        width: 35.w,
                        child: buildTextField('Last name', TextInputType.text)),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                buildTextField('Email address', TextInputType.text),
                SizedBox(
                  height: 18,
                ),
                buildTextField('street address', TextInputType.text),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 35.w,
                        child: buildTextField('Zip code', TextInputType.number)),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                        height: 40,
                        width: 40.w,
                        child: buildTextField('Phone', TextInputType.number)),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 35.w,
                        child:
                            buildTextField('State code', TextInputType.number)),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                        height: 40,
                        width: 40.w,
                        child: buildTextField('city', TextInputType.text)),
                  ],
                ),
                ListTile(
                  leading: Obx(
                    () => Checkbox(
                      value: controller.check.value,
                      onChanged: (value) {
                        controller.check.value = value!;
                      },
                    ),
                  ),
                  title: Text('Create an account for later use'),
                ),
                ListTile(
                  leading: Obx(
                    () => Checkbox(
                      value: controller.check1.value,
                      onChanged: (value) {
                        controller.check1.value = value!;
                      },
                    ),
                  ),
                  title: Text('My billing and shipping address are the same'),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40,
                        width: 35.w,
                        child:TextField(
                          // controller: txtemail,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: Text("Password "),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                        )),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                        height: 40,
                        width: 35.w,
                        child:TextField(
                          // controller: txtemail,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: Text("Confirm Password "),
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                        ),),
                    SizedBox(height: 20,),

                  ],
                ),
                SizedBox(height: 30,),
                Center(
                  child: InkWell(
                    onTap: () {
                      print("====================================================================${model!.name}");
                      Get.toNamed('/payd',arguments: model);

                    },
                    child: Container(
                      height: 6.5.h,
                      width: 150,
                      // width: 40.h,
                      decoration: BoxDecoration(
                        // color: Color(0xff9F57F9),
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30.sp)
                      ),
                      child: Center(child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(title, TextInputType) {
    return TextField(
      keyboardType: TextInputType,
      // controller: txtemail,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text("$title "),
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
