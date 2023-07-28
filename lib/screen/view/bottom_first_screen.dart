import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
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
                style: TextStyle(color: Colors.black),
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
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed('/prode',arguments: index);
                          },
                          child: Container(
                            height: 15.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: Colors.grey.shade300,
                                image: DecorationImage(
                                    image: AssetImage(
                                        '${controller.recommenedList[index].img}'))),
                          ),
                        ),
                        Text('${controller.recommenedList[index].name}',style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text('₹  ${controller.recommenedList[index].price}'),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('  ${controller.recommenedList[index].rat } ⭐',style: TextStyle(color: Colors.green),),
                        )
                      ],
                    );
                  },
                  itemCount: controller.recommenedList.length),
            )
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