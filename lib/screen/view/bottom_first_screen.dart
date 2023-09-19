import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:e_commerce_firebase_user/screen/controller/userController.dart';
import 'package:e_commerce_firebase_user/screen/model/screen_model.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomFirstScreen extends StatefulWidget {
  const BottomFirstScreen({Key? key}) : super(key: key);

  @override
  State<BottomFirstScreen> createState() => _BottomFirstScreenState();
}

class _BottomFirstScreenState extends State<BottomFirstScreen> {
  screenController controller = Get.put(screenController());
  UserController con = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    con.userdata.value=FireBaseHelper.base.userData();
    // controller.l1.clear();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              )),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'scan',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            ListTile(
              leading: Text(
                'Browse by Categories',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 15.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(
                                    '${controller.photo[index].img}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${controller.photo[index].name}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '${controller.photo[index].subname}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: controller.photo.length,
                  scrollDirection: Axis.horizontal,
                  itemExtent: 200),
            ),
            ListTile(
              leading: Text(
                "Recommended for You",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            /**/
            // Expanded(
            //   child: GridView.builder(
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2, mainAxisExtent: 200,childAspectRatio: 100),
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             InkWell(
            //               onTap: () {
            //                 Get.toNamed('/prode', arguments: index);
            //               },
            //               child: Container(
            //                 height: 20.h,
            //                 width: 35.w,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(15.sp),
            //                   color: Colors.grey.shade300,
            //
            //                 ),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     SizedBox(height: 10,),
            //                     Image.asset("${controller.recommenedList[index].img}",height: 10.h,),
            //                     SizedBox(height: 10,),
            //                     Text(
            //                       '${controller.recommenedList[index].name}',
            //                       style: TextStyle(fontWeight: FontWeight.bold),
            //                     ),
            //                     SizedBox(
            //                       height: 0.5.h,
            //                     ),
            //                     Text('₹  ${controller.recommenedList[index].price}'),
            //                     // SizedBox(
            //                     //   height: 1.h,
            //                     // ),
            //                     // Container(
            //                     //   decoration: BoxDecoration(
            //                     //       borderRadius: BorderRadius.circular(10)),
            //                     //   child: Text(
            //                     //     '  ${controller.recommenedList[index].rat} ⭐',
            //                     //     style: TextStyle(color: Colors.green),
            //                     //   ),
            //                     // ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //
            //           ],
            //         );
            //       },
            //       itemCount: controller.recommenedList.length),
            // ),
/**/
            /*================================================================*/
            StreamBuilder(builder: (context, snapshot) {
             if(snapshot.hasError)
               {
                 return Text('${snapshot.error}');
               }
             else if(snapshot.hasData)
               {
                 QuerySnapshot querySnapshot=snapshot.data!;
                 List<QueryDocumentSnapshot> querysnapList=querySnapshot.docs;
                 // List<productModel> l1=[];
                 controller.l1.clear();

                 for(var x in querysnapList)
                   {
                     Map m1=x.data() as Map;
                     String id =x.id;
                     String name=m1['name'];
                     String cat=m1['cate'];
                     String dec = m1['dec'];
                     String img = m1['img'];
                     String price = m1['price'];


                     productModel model=productModel(price: price,img: img,name: name,cate: cat,dec: dec,id:id);

                     controller.l1.add(model);

                   }

                 return  Expanded(
                   child: GridView.builder(
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2, mainAxisExtent: 200,childAspectRatio: 100),
                       itemBuilder: (context, index) {
                         return Column(
                           children: [
                             InkWell(
                               onTap: () {
                                 Get.toNamed('/prode', arguments: index);
                               },
                               child: Container(
                                 height: 22.h,
                                 width: 35.w,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15.sp),
                                   color: Colors.grey.shade300,

                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     SizedBox(height: 10,),
                                     // Image.asset("${l1[index].img}",height: 10.h,),
                                     SizedBox(height: 10,),
                                     controller.l1[index].img!.isEmpty?Image.network("https://m.media-amazon.com/images/I/41ATdIgTJLL.jpg",
                                       height: 10.h,): Image.network(
                                       "${controller.l1[index].img}",
                                       height: 10.h,
                                       fit: BoxFit.cover,
                                     ),
                                     Text(
                                       '${controller.l1[index].name}',
                                       style: TextStyle(fontWeight: FontWeight.bold),
                                     ),
                                     SizedBox(
                                       height: 0.5.h,
                                     ),
                                     Text('₹  ${controller.l1[index].price}'),
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
                       itemCount: controller.l1.length),
                 );

               }

             return Center(child: CircularProgressIndicator());
            },stream: FireBaseHelper.base.readProductData(),)
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    FireBaseHelper.base.signOut();

                    Get.offAllNamed('/login');
                  },
                  child: Text("Log out")),
            ],
          ),
        ),
      ),
    );
  }

  Widget photo() {
    return Column(
      children: [
        Container(
          height: 15.h,
          width: 25.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage('assets/image/f1.png'), fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '100+ Product',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Green Armchair',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
