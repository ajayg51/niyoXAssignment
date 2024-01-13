import 'package:get/get.dart';
import 'home_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(HomeScreen());
    });
  }
}
