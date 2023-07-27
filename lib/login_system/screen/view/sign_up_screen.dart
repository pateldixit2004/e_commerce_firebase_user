import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Text("Sign Up",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),

            TextField(
              controller: txtemail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Email"),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: txtpassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("password"),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))

              ),
            ),
            SizedBox(height: 5.h,),
            InkWell(
              onTap: () async {
                String msg=await FireBaseHelper.base.createUser(txtemail.text, txtpassword.text);
                if(msg=="Sucess")
                {
                  Get.back();
                }
                Get.snackbar('$msg','',backgroundColor: msg=="Sucess"?Colors.green:Colors.red );


              },
              child:Container(
                height: 6.5.h,
                width: 95.h,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.sp)

                ),
                child: Center(child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
            Spacer(),

            TextButton(onPressed: () {


              Get.back();
            }, child: Text("Already have account"),),
          ],
        ),
      ),
    ),);
  }
}
