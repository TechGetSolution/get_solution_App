import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/color_constant.dart';
import '../../utils/display_utils.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List names = [
    "Current Balence",
    "Total Deposited",
    "Total Transactions",
    "Total Orders",
    "Complete Orders",
    "Incomplete Orders",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: tgWhite,
        ),
        title: Text(
          'DashBoard',
          style: TextStyle(color: tgWhite, fontSize: 15.sp),
        ),
        centerTitle: true,
        backgroundColor: tgreen,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          boxShadow: [tgBoxShadow],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), // Adjust the radius as needed
            topRight: Radius.circular(40.0),
            // Adjust the radius as needed
          ),
          color: tgWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(20),
            GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1.4),
                itemCount: 6,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var column = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vGap(3),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: tgreen, shape: BoxShape.circle),
                        child: Icon(Icons.wallet),
                      ),
                      vGap(3),
                      Text(
                        "\$100.00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      vGap(3),
                      Text(
                        names[index],
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgGray),
                      ),
                    ],
                  );
                  return GestureDetector(
                    onTap: () {
                      //   if (index == 1) {
                      //     Get.to(DepositHistorPage());
                      //   }
                      //   if (index == 2) {
                      //     Get.to(TransactionPage());
                      //   }
                    },
                    child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: tgWhite,
                            boxShadow: [tgBoxShadow],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: tglightGray, width: 1)

                            // fit: BoxFit.fill,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [column],
                        )),
                  );
                }),
            vGap(5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Latest Transactions',
                style: TextStyle(
                    fontSize: isTab(context) ? 7.sp : 12.sp,
                    fontWeight: FontWeight.w700,
                    color: tgBlack),
              ),
            ),
            vGap(5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: tgWhite,
                  boxShadow: [tgBoxShadow],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Seller',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        'Seller',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                    ],
                  ),
                  vGap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                      Text(
                        ' :',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tglightGray),
                      ),
                      Text(
                        '24 Jab 2023',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                    ],
                  ),
                  vGap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                      Text(
                        ' :',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tglightGray),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '\$3000',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                    ],
                  ),
                  vGap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                      Text(
                        ' :',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tglightGray),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 10.sp,
                            fontWeight: FontWeight.w700,
                            color: tgBlack),
                      ),
                      Text(
                        'Paid',
                        style: TextStyle(
                            fontSize: isTab(context) ? 7.sp : 12.sp,
                            fontWeight: FontWeight.w500,
                            color: tglightGray),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
