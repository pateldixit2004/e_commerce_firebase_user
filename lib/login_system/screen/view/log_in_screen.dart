import 'package:e_commerce_firebase_user/intro_screen/controller/intro_controller.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpasssword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 20.h,),
              Image.asset('assets/image/su1.png'),

              Text("Sign In",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  label: const Text("Email"),
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: txtpasssword,
                obscureText: true,

                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),

                    label: const Text("Password"),
                  labelStyle: TextStyle(color: Colors.black),

                ),
              ),
              SizedBox(height: 15,),

              InkWell(
                onTap: () async {
                  String msg=await FireBaseHelper.base.signIn(txtemail.text,txtpasssword.text);
                  if(msg=='Sucess')
                    {
                      Get.offAllNamed('/home');
                    }
                  Get.snackbar("${msg}", '',backgroundColor:msg=='Sucess'?Colors.green:Colors.redAccent);
                },
                child: Container(
                  height: 6.5.h,
                  width: 95.h,
                  decoration: BoxDecoration(
                    // color: Color(0xff9F57F9),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.sp)
                  ),
                  child: Center(child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),
                ),
              ),
              SizedBox(height: 5.h,),
              Text("-------or continues with-------",style: TextStyle(fontSize: 20),),
              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      String msg=await FireBaseHelper.base.anonymouslyGet();
                      if(msg=='Sucess')
                      {
                        Get.offAllNamed('/home');
                      }
                      Get.snackbar('$msg','',backgroundColor: msg=="Sucess"?Colors.green:Colors.red );

                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage('assets/image/img.png',),fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {

                      String msg=await FireBaseHelper.base.googleSignIn();
                      Get.snackbar('$msg','',backgroundColor: msg=="Succes"?Colors.green:Colors.red );
                      if(msg=="Succes")
                      {
                        Get.offAllNamed("/home");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage('assets/image/img_1.png',),fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h,),

                TextButton(onPressed: () {

                  Get.toNamed('/signUp');


                }, child: Text("Create a account! sign up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),),

            ],
          ),

        ),
      ),
    ),);
  }
}
