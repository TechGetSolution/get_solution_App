import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get_solution/routes/app_routes.dart";
import "package:sizer/sizer.dart";

import "../../components/tgButton.dart";
import "../../components/tgTextFormField.dart";

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Use the BorderedTextFormField for Username/
                BorderedTextFormField(
                  hintText: 'Username',
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 1.h,
                ), // Use the BorderedTextFormField for Password
                BorderedTextFormField(
                  hintText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),

                // Add any other widgets or buttons you need
                TGButton(
                  text: 'Click Me',
                  onPressed: () {
                    // Place your action or function here when the button is pressed
                    print('Button clicked!');
                    Future.delayed(Duration(seconds: 3));
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, do something with the data
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // For example, you can print the values
                      print('Username: $username');
                      print('Password: $password');
                      Get.toNamed(AppRoutes.loginPage);
                    }
                  },
                  isLoading:
                      false, // Set it to true to show the loader animation
                  color: Colors.blue, // Change the button color if needed
                  loaderColor: Colors
                      .white, // Change the loader animation color if needed
                ),
              ],
            ),
          ),
        ));
  }
}
