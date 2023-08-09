import 'package:e_commerce_firebase_user/payment/payment.dart';
import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:e_commerce_firebase_user/screen/model/screen_model.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaymentDeatilScreen extends StatefulWidget {
  const PaymentDeatilScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDeatilScreen> createState() => _PaymentDeatilScreenState();
}

class _PaymentDeatilScreenState extends State<PaymentDeatilScreen> {
  screenController controller = Get.put(screenController());
productModel? model;
  @override
  void initState() {
    super.initState();
    model=Get.arguments;
    print("=====================================================$model");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          ListTile(
            leading: Text("Billing Summary",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          buildListTile('Product name','${model!.name}'),
          buildListTile('pricke','${model!.price}'),
          buildListTile('Discount',0),
          buildListTile('Shipping',50),
          buildListTile('Tax',"${(int.parse(model!.price!) * 0.01 )}"),
          Divider(),
          buildListTile('total', '${50+int.parse(model!.price!)+(int.parse(model!.price!) * 0.01 )}'),
          Spacer(),
          InkWell(
            onTap: () {

              PaymentHelper.payment.setPayment(20);
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
              child: Center(child: Text("Place order",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
            ),
          ),
        ],

      ),
    ),);
  }

  ListTile buildListTile(name,price) {
    return ListTile(
          leading: Text("$name"),
          trailing:  Text("$price"),
        );
  }
}
