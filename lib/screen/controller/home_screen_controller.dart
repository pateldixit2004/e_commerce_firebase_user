import 'package:e_commerce_firebase_user/screen/view/bottom_first_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxInt indexBottom=0.obs;
  List screenList=[
BottomFirstScreen(),
BottomFirstScreen(),
  ];
}