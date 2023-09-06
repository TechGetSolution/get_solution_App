import 'package:get/get.dart';

class LoginController extends GetxController {
  // You can add more fields like password, OTP, etc., if required
  RxString phoneNumber = ''.obs;

  void updatePhoneNumber(String phone) {
    phoneNumber.value = phone;
  }

  void login() {
    // Add your login logic here, for example, sending OTP or handling login with the phone number
    // You can navigate to another screen on successful login using Get.toNamed() method.
  }
}
