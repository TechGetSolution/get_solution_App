import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:get_solution/routes/app_routes.dart';
import 'package:get_solution/utils/display_utils.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var amount = "\$500.00";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tglightGray.withOpacity(0.20),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          leadingWidth: 40,
          title: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: tgWhite,
                  )),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mohd Naushad',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Text(
                    'Deposit Balence: ${amount}',
                    style: TextStyle(fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
          centerTitle: true,
          backgroundColor: tglightGray.withOpacity(0.0),
        ),
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
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
                    Icons.person_rounded,
                    color: tgWhite,
                  ),
                ),
                title: Text("My Profile"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.dashboard,
                    color: tgWhite,
                  ),
                ),
                title: Text("Dashboard"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.dashBoardpage);
                },
              ),
              vGap(5),
              ExpansionTile(
                tilePadding: EdgeInsets.only(left: 5, right: 20),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: tglightGray,
                  size: 30,
                ),
                title: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: tgPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.payment_rounded,
                      color: tgWhite,
                    ),
                  ),
                  title: Text("Deposit"),
                ),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    leading: Icon(
                      Icons.add,
                      color: tgPrimaryColor,
                    ),
                    title: Text("Add Deposit"),
                    onTap: () {
                      Get.toNamed(AppRoutes.addDepositPage);
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    leading: Icon(
                      Icons.history,
                      color: tgPrimaryColor,
                    ),
                    title: Text("Deposit History"),
                    onTap: () {
                      Get.toNamed(AppRoutes.depositHistoryPage);
                    },
                  ),
                ],
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.payments_rounded,
                    color: tgWhite,
                  ),
                ),
                title: Text("Transaction"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.transactionHistoryPage);
                },
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.favorite,
                    color: tgWhite,
                  ),
                ),
                title: Text("Favorite"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.favoriteListPage);
                },
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.edit_document,
                    color: tgWhite,
                  ),
                ),
                title: Text("Seller Report"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.reportPage);
                },
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.settings,
                    color: tgWhite,
                  ),
                ),
                title: Text("Setting"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.settingPage);
                },
              ),
              vGap(5),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: tgPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.person_add_alt_outlined,
                    color: tgWhite,
                  ),
                ),
                title: Text("Invite Friends"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
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
                    Icons.report_problem,
                    color: tgWhite,
                  ),
                ),
                title: Text("Help & Support"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
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
                    Icons.logout_rounded,
                    color: tgWhite,
                  ),
                ),
                title: Text("Log Out"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: tglightGray,
                ),
                onTap: () {},
              ),
            ]),
          ),
        ));
  }
}
