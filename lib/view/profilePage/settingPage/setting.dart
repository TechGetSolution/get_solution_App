import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:get_solution/routes/app_routes.dart';
import 'package:get_solution/utils/display_utils.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tgWhite,
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: tgWhite,
              ),
            ),
            title: Text(
              'Setting',
              style: TextStyle(color: tgWhite),
            ),
            centerTitle: true,
            backgroundColor: tgPrimaryColor),
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            boxShadow: [tgBoxShadow],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), // Adjust the radius as needed
              topRight: Radius.circular(40.0),
              // Adjust the radius as needed
            ),
            color: tgWhite,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              vGap(30),
              ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: tgPrimaryColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.notifications,
                      color: tgWhite,
                    ),
                  ),
                  title: Text("Push Notifications"),
                  trailing: CupertinoSwitch(
                    activeColor: tgPrimaryColor,
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  )),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.translate,
                    color: tgWhite,
                  ),
                ),
                title: Text("Language"),
                trailing: Text("English"),
                onTap: () {},
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.report_problem_sharp,
                    color: tgWhite,
                  ),
                ),
                title: Text("Privacy Policy"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: tglightGray,
                ),
                onTap: () {},
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.security_update_good,
                    color: tgWhite,
                  ),
                ),
                title: Text("Terms of Service"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: tglightGray,
                ),
                onTap: () {},
              ),
            ]),
          ),
        ));
  }
}
