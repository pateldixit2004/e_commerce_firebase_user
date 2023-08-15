import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:e_commerce_firebase_user/screen/model/add_to_card.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  screenController controller = Get.put(screenController());
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment(0.9, 1.5),
                  children: [
                    Container(
                      height: 40.h,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 30,),
                              Text(
                                '${controller.l1[index].cate}',
                                style: TextStyle(color: Colors.grey,fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${controller.l1[index].name}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "From",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "₹ ${controller.l1[index].price}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20,),
                              Text('Available Colors',style: TextStyle(color: Colors.grey),),
                              SizedBox(height: 10,),

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 4,),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 4,),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    color: Colors.yellow,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Image.network(
                    //   '${controller.l1[index].img}',
                    //   height: 30.h,
                    //   width: 50.w,
                    // ),
                    controller.l1[index].img!.isEmpty?Image.network("https://m.media-amazon.com/images/I/41ATdIgTJLL.jpg",
                      height: 28.h,): Image.network(
                      "${controller.l1[index].img}",
                      height: 28.h,fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                ListTile(
                  leading: Text(
                    "Tieton Armchair",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work."),
                ),
                SizedBox(height: 10.h),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   InkWell(
                     onTap: () {
                     FireBaseHelper.base.addCard(controller.l1[index]);
                     Get.snackbar("Successful add to Card...", "");

                       // Get.toNamed('/add');
                     },
                     child: Container(
                       height: 6.5.h,
                       width: 150,
                       // width: 40.h,
                       decoration: BoxDecoration(
                         // color: Color(0xff9F57F9),
                           color: Colors.grey,
                           borderRadius: BorderRadius.circular(30.sp)
                       ),
                       child: Center(child: Text("Add to card",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                     ),
                   ),
                   InkWell(
                     onTap: () {
                       controller.buyNowList.add(controller.l1[index]);
                       Get.toNamed('/buy',arguments: controller.l1[index]);
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
                       child: Center(child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
