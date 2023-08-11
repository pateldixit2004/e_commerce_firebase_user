import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:e_commerce_firebase_user/screen/model/add_to_card.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddToCardScreen extends StatefulWidget {
  const AddToCardScreen({Key? key}) : super(key: key);

  @override
  State<AddToCardScreen> createState() => _AddToCardScreenState();
}

class _AddToCardScreenState extends State<AddToCardScreen> {
  screenController controller=Get.put(screenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: StreamBuilder(builder: (context, snapshot) {
        if(snapshot.hasError)
          {
            return Text("${snapshot.error}");
          }
        else if(snapshot.hasData)
          {
            QuerySnapshot querySnapshot=snapshot.data!;
            List<QueryDocumentSnapshot> querysnapList =querySnapshot.docs;
            List<AddtoCardModel> cardList=[];
            controller.totalprice.value=0;

        for(var x in querysnapList)
              {
                Map m1=x.data() as Map;
                String id=x.id;
                String name=m1['name'];
                String cat=m1['cate'];
                String dec = m1['dec'];
                String img = m1['img'];
                String price = m1['price'];



                // controller.totalprice.value+=double.parse('$price');

                AddtoCardModel model=AddtoCardModel(name: name,cate: cat,dec: dec,img: img,price: price,id: id);
                cardList.add(model);
                print("=========================================$cardList====================================");
                print("=========================================${controller.totalprice.value}====================================");

              }
            return Column(
              children: [
                SizedBox(
                  height: 400,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      height: 14.h,
                      width: 100.w,
                      child: Row(
                        children: [
                          Container(
                            height: 12.h,
                            width: 11.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("${cardList[index].img}"),),
                            ),
                          ),
                          SizedBox(width: 2.w,),
                          SizedBox(
                            height: 30.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${cardList[index].name}"),
                                SizedBox(height: 0.5.h,),
                                Obx(() =>  Text("${controller.total.value}=========")),

                                Obx( () => Text("Quantity ${controller.qut.value}"),),
                              ],
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 30.h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: () {

                                    }, icon: Icon(Icons.close))
                                  ],
                                ),


                                // Obx(() =>  Text("${cardList[index].price! * controller.qut.value! }")),


                                Text("${cardList[index].price!  }"),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {
                                      if(controller.qut.value>0)
                                        {
                                          controller.qut.value--;
                                        }
                                    }, icon: Icon(Icons.remove),),
                                    Obx(() =>  Text("${controller.qut.value}")),
                                  // Text("${controller.qut.value}"),
                                    IconButton(onPressed: () {
                                      controller.qut.value++;
                                    }, icon: Icon(Icons.add),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },itemCount: cardList.length,),
                ),

        ],
            );



          }
        return Center(child: CircularProgressIndicator());
      },stream: FireBaseHelper.base.getCardData(),)
    ),);
  }

  Container buildContainer(List<AddtoCardModel> cardList, int index) {
    return Container(
                      height: 100,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network('${cardList[index].img}'),

                          // ListTile(
                          //   leading: Text("${cardList[index].name}"),
                          //   trailing: IconButton(onPressed: () {
                          //
                          //   }, icon: Icon(Icons.close)),
                          // ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("${cardList[index].name}"),
                                  Text("${cardList[index].price}"),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Qut"),
                                  // Spacer(),
                                  Row(
                                    children: [
                                      IconButton(onPressed: () {
                                        controller.qut.value--;
                                      }, icon: Icon(Icons.remove),),
                                      Obx(() =>  Text("${controller.qut.value}")),
                                      IconButton(onPressed: () {
                                        controller.qut.value++;
                                      }, icon: Icon(Icons.add),),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
  }

  // ListView buildListView() {
  //   return ListView.builder(itemBuilder: (context, index) {
  //     return Container(
  //       height: 70,
  //       child: Row(
  //         children: [
  //           Image.network('${cardList[index].img}'),
  //           Column(
  //             children: [
  //               Text("${cardList[index].name}"),
  //               Row(
  //                 children: [
  //                   IconButton(onPressed: () {
  //                     controller.qut.value--;
  //                   }, icon: Icon(Icons.remove),),
  //                   Obx(() =>  Text("${controller.qut.value}")),
  //                   IconButton(onPressed: () {
  //                     controller.qut.value++;
  //                   }, icon: Icon(Icons.add),),
  //                 ],
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     );
  //   },itemCount: cardList.length,);
  // }
  //
  // ListTile buildListTile(int index) {
  //   return ListTile(
  //       leading: Image.network("${cardList[index].img}"),
  //       title: Text("${cardList[index].name}"),
  //       subtitle: Text("${cardList[index].price}"),
  //     );
  // }
}
