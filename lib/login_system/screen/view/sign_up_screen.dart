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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 100.h,
            child: Column(
              children: [
                // SizedBox(height: 20.h,),
                Image.asset('assets/image/su1.png'),
                Text("Create your account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
                    label: Text("Password"),
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
                        // color: Color(0xff9F57F9),
                      color: Colors.green,
                        borderRadius: BorderRadius.circular(30.sp)

                    ),
                    child: Center(child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                  ),
                ),
                SizedBox(height: 20.h,),
                TextButton(onPressed: () {
                  Get.back();
                }, child: Text("Already have account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
