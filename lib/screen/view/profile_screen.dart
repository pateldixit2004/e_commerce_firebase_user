import 'package:e_commerce_firebase_user/screen/controller/userController.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController controller=Get.put(UserController());
  @override
  void initState() {
    super.initState();
     controller.userdata.value=FireBaseHelper.base.userData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey
              ),
              child: Row(
                children: [
                  ClipRRect(child: Image.network('https://cdn-icons-png.flaticon.com/128/4140/4140048.png'),),
                  SizedBox(width: 4,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(controller.userdata['name']==null?'admin':"${controller.userdata['name']}"),
                      Text(controller.userdata['email']==null?'adamin209@gamil.com':"${controller.userdata['email']}"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 35.h,
              padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 2.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.w),

              ),
              child: Column(
                children: [
                  profileDetalie(title: "Personal Details",iconData: Icons.person_2_rounded),
                  profileDetalie(title: "My Order",iconData: Icons.card_travel_rounded),
                  profileDetalie(title: "My Favourites",iconData: Icons.favorite_rounded),
                  profileDetalie(title: "Shipping Address",iconData: Icons.local_shipping_rounded),
                  profileDetalie(title: "My Card",iconData: Icons.credit_card_rounded),
                  profileDetalie(title: "Settings",iconData: Icons.settings),

                ],
              ),
            ),
            SizedBox(height: 2.5.h,),
            Container(
              height: 21.5.h,
              padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 2.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                  border: Border.all(color: Colors.black12)

              ),
              child: Column(
                children: [
                  profileDetalie(title: "FAQs",iconData: Icons.info),
                  profileDetalie(title: "Privacy Policy",iconData: Icons.privacy_tip_rounded),
                  profileDetalie(title: "Help",iconData: Icons.help_outline_rounded),
                ],
              ),
            )
          ],

        ),
      ),
    ),);
  }
  Widget profileDetalie({iconData ,title})
  {
    return Row(
      children: [
        Container(
          height: 5.h,
          width: 5.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            color: Color(0xfff3f5f6)
          ),
          alignment: Alignment.center,
          child: Icon(iconData,size: 20.sp,),
        ),
        SizedBox(width: 5.w,),
        Text("${title}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13.sp),),
        Spacer(),
        Icon(Icons.arrow_forward_ios_rounded,size: 14.sp,),

      ],
    );
  }
}
