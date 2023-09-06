import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:sizer/sizer.dart';

import '../../../components/tgButton.dart';
import '../../../constants/image_constants.dart';
import '../../../controller/login_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/display_utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Login Account ",
                          style: TextStyle(
                              color: tgBlack,
                              fontSize: isTab(context) ? 10.sp : 16.sp,
                              fontWeight: FontWeight.w700)),
                      Image.asset(
                        Images.USERICON,
                        scale: isTab(context) ? 2 : 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Hello , welcome to our account !",
                      style: TextStyle(
                          color: tgGray,
                          fontSize: isTab(context) ? 10.sp : 10.sp,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 20.h,
                child: Center(
                  child: Image.asset(
                    Images.LOGINIMG,
                    height: isTab(context) ? 30.h : 40.h,
                  ),
                  //  FlutterLogo(
                  //   size: isTab(context) ? 40.h : 65.h,
                  // ),
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
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              color: tgBlack,
                              fontSize: isTab(context) ? 11.sp : 13.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          // decoration: BoxDecoration(
                          //     // color: tWhite,
                          //     borderRadius: BorderRadius.circular(10),
                          //     boxShadow: [tBoxShadow]),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Mobile number can't be empty";
                              } else if (value.length != 10 &&
                                  value.length < 10) {
                                return 'Mobile number must be 10 digits';
                              } else {
                                return null;
                              }
                            },
                            // controller: _usernumbercontroller,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: isTab(context) ? 12.sp : 14.sp),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(
                                "[0-9]",
                              )),
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: InputDecoration(
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 13),
                                    child: Image.asset(
                                      Images.FLAGICON,
                                      scale: isTab(context) ? 3 : 4,
                                    ),
                                  ),
                                  SizedBox(
                                      width: isTab(context) ? 1.2.w : 2.2.w),
                                  Image.asset(
                                    Images.VLINE,
                                    height: 30,
                                    width: 5,
                                    color: tglightGray,
                                  ),
                                  SizedBox(width: isTab(context) ? 1.w : 2.w),
                                ],
                              ),
                              hintStyle: TextStyle(
                                  fontSize: isTab(context) ? 10.sp : 12.sp,
                                  color: tglightGray,
                                  fontWeight: FontWeight.w400),
                              hintText: 'Mobile Number',
                              fillColor: tgWhite,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: tgPrimaryColor, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: tgPrimaryColor, width: 0.7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TGButton(
                    text: 'Login',

                    onPressed: () {
                      // Place your action or function here when the button is pressed
                      print('Button clicked!');
                      if (_formKey.currentState!.validate()) {
                        Get.toNamed(AppRoutes.otpPage);
                      }
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
}
