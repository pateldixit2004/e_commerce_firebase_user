import 'package:e_commerce_firebase_user/screen/model/screen_model.dart';
import 'package:get/get.dart';

class screenController extends GetxController {
  List<ScreenModel> photo = [
    ScreenModel(
        name: 'Green Armchair',
        subname: '100+ Product',
        img: 'assets/image/f1.png'),
    ScreenModel(
        name: 'Sofa Red', subname: '10+ Product', img: 'assets/image/f2.png'),
    ScreenModel(
        name: 'Green Armchair',
        subname: '100+ Product',
        img: 'assets/image/f1.png'),
    ScreenModel(
        name: 'Sofa Red', subname: '10+ Product', img: 'assets/image/f2.png'),
    ScreenModel(
        name: 'Green Armchair',
        subname: '100+ Product',
        img: 'assets/image/f1.png'),
    ScreenModel(
        name: 'Sofa Red', subname: '10+ Product', img: 'assets/image/f2.png'),
    ScreenModel(
        name: 'Green Armchair',
        subname: '100+ Product',
        img: 'assets/image/f1.png'),
    ScreenModel(
        name: 'Sofa Red', subname: '10+ Product', img: 'assets/image/f2.png'),
    ScreenModel(name: 'Green Armchair', subname: '100+ Product', img: 'assets/image/f1.png'),
    ScreenModel(
        name: 'Sofa Red', subname: '10+ Product', img: 'assets/image/f2.png'),
  ];
  List<productModel> recommenedList = [
    productModel(name: 'Wood Frame',img: 'assets/image/r1.png',price:'1000',rat: '4.5'),
    productModel(name: 'Yellow Armchair',img: 'assets/image/r3.png',price:'2000',rat: '4.0'),
    productModel(name: 'Wood Frame',img: 'assets/image/r1.png',price:'1000',rat: '4.5'),
    productModel(name: 'Yellow Armchair',img: 'assets/image/r3.png',price:'2000',rat: '4.0'),
  ];
  List<productModel> addtocardList=[];
  List<productModel> buyNowList=[];
  List<productModel> l1=[];


  RxInt qut=1.obs;

}
