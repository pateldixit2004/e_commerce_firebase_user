import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase_user/screen/controller/screen_contoller.dart';
import 'package:e_commerce_firebase_user/screen/model/add_to_card.dart';
import 'package:e_commerce_firebase_user/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            
            for(var x in querysnapList)
              {
                Map m1=x.data() as Map;
                String id=x.id;
                String name=m1['name'];
                String cat=m1['cate'];
                String dec = m1['dec'];
                String img = m1['img'];
                String price = m1['price'];
                
                AddtoCardModel model=AddtoCardModel(name: name,cate: cat,dec: dec,img: img,price: price,id: id);
                cardList.add(model);
                
              }
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  child: Row(
                    children: [
                      Image.network('${cardList[index].img}'),
                      Column(
                        children: [
                          Text("${cardList[index].name}"),
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
                  ),
                );
              },itemCount: cardList.length,),
            );
            
            
            
          }
        return Center(child: CircularProgressIndicator());
      },stream: FireBaseHelper.base.getCardData(),)
    ),);
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
