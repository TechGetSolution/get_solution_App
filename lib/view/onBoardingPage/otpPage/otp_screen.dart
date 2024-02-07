// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:sizer/sizer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../components/tgButton.dart';
import '../../../constants/image_constants.dart';
import '../../../controller/login_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/display_utils.dart';

class OtpScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 20.h,
                child: Center(
                  child: Image.asset(
                    Images.OTPIMG,
                    height: isTab(context) ? 30.h : 40.h,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: tgWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [tgBoxShadow]),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Otp",
                          style: TextStyle(
                              color: tgBlack,
                              fontSize: isTab(context) ? 15.sp : 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          child: _otpFeild(context),
                        ),
                      ],
                    ),
                  ),
                  TGButton(
                    text: 'Verify',

                    onPressed: () {
                      // Place your action or function here when the button is pressed
                      print('Button clicked!');
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed(AppRoutes.bottomNavigationPage);
                      }
                      // Future.delayed(Duration(seconds: 3));
                    },
                    isLoading:
                        false, // Set it to true to show the loader animation
                    color: Colors.blue, // Change the button color if needed
                    loaderColor: Colors
                        .white, // Change the loader animation color if needed
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: tgPrimaryColor,
                          image: DecorationImage(
                            image: AssetImage("assets/icons/bradial.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your number is safe with us, we don`t use your number",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: tgGray,
                            fontSize: isTab(context) ? 7.sp : 8.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "for any unsolicited communication.",
                        style: TextStyle(
                            color: tgGray,
                            fontWeight: FontWeight.w400,
                            fontSize: isTab(context) ? 7.sp : 8.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpFeild(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: PinCodeTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Otp can't be empty";
            } else if (value.length != 5 && value.length < 5) {
              return 'Otp must be 5 digits';
            } else {
              return null;
            }
          },
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            LengthLimitingTextInputFormatter(5),
          ],
          appContext: context,
          pastedTextStyle: TextStyle(
            color: tgBlack,
            fontWeight: FontWeight.bold,
          ),
          length: 5,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            borderWidth: 1,
            shape: PinCodeFieldShape.circle,
            activeColor: Colors.transparent,
            selectedColor: tgPrimaryColor,
            selectedFillColor: tglightGray.withOpacity(0.20),
            inactiveFillColor: tglightGray.withOpacity(0.20),
            inactiveColor: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            fieldHeight: 15.w,
            fieldWidth: 14.w,
            activeFillColor: tglightGray.withOpacity(0.20),
          ),
          cursorColor: tglightGray,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: _otpController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            print("Completed");
          },
          onTap: () {
            print("Pressed");
          },
          onChanged: (value) {
            print(value);
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");

            return true;
          },
        ),
      ),
    );
  }
}
