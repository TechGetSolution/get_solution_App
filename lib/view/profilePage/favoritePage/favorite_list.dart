import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/display_utils.dart';
import '../../depositPage/deposit_history.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  // Set the default selected value here
  DateTime? selectedDate;
  List<DepositItem> depositHistory = [
    DepositItem(date: DateTime(2023, 9, 1), amount: 100.0),
    DepositItem(date: DateTime(2023, 9, 27), amount: 100.0),

    DepositItem(date: DateTime(2023, 9, 24), amount: 100.0),

    // Add more deposit items here
  ];
  List title = [
    "Mobile Ui Ux design or app deign",
    "Mobile Ui Ux design or app deign",
    "Mobile Ui Ux design or app deign",
  ];
  List name = [
    "Paid",
    "Cancelled",
    "Pending",
  ];
  List currenyColor = [
    Colors.green,
    Colors.red,
    Colors.grey,
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
          'Favorite List',
          style: TextStyle(
              fontSize: 15.sp, color: tgWhite, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: tgreen,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
          boxShadow: [tgBoxShadow],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), // Adjust the radius as needed
            topRight: Radius.circular(40.0),
            // Adjust the radius as needed
          ),
          color: tgWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: _depositHistoyWidget(),
        ),
      ),
    );
  }

  Widget _depositHistoyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20.0),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refreshList,
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return ListView.builder(
                itemCount: depositHistory.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  final deposit = depositHistory[index];
                  if (selectedDate == null ||
                      deposit.date.isSameDay(selectedDate!)) {
                    return Container(
                        width: getWidth(context),
                        height: 12.h,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                            color: tgWhite,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [tgBoxShadow]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: getHeight(context),
                                width: 20.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        10.0), // Adjust the radius as needed
                                    bottomLeft: Radius.circular(10.0),
                                    // Adjust the radius as needed
                                  ),
                                  color: tg2color,
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: tgWhite,
                                  size: 50,
                                )),
                            hGap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                vGap(10),
                                Container(
                                  child: Text(
                                    title[index],
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: isTab(context) ? 7.sp : 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: tgBlack),
                                  ),
                                ),
                                vGap(5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        Text(
                                          "5.0",
                                          style: TextStyle(
                                              fontSize:
                                                  isTab(context) ? 7.sp : 9.sp,
                                              fontWeight: FontWeight.w500,
                                              color: tglightGray),
                                        ),
                                        hGap(2),
                                        Text(
                                          "(520)",
                                          style: TextStyle(
                                              fontSize:
                                                  isTab(context) ? 7.sp : 9.sp,
                                              fontWeight: FontWeight.w500,
                                              color: tglightGray),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: tgWhite,
                                                border: Border.all(
                                                    color: tglightGray,
                                                    width: 1)),
                                            child: Icon(
                                              Icons.person,
                                              color: tgred,
                                              size: 20,
                                            )),
                                        hGap(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Khalid",
                                              style: TextStyle(
                                                  fontSize: isTab(context)
                                                      ? 7.sp
                                                      : 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: tgBlack),
                                            ),
                                            hGap(2),
                                            Text(
                                              "Seller Lavel :${"1"}",
                                              style: TextStyle(
                                                  fontSize: isTab(context)
                                                      ? 7.sp
                                                      : 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: tglightGray),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: tgWhite,
                                        border: Border.all(
                                            color: tglightGray, width: 1)),
                                    child: Icon(
                                      Icons.favorite,
                                      color: tgred,
                                      size: 15,
                                    )),
                                Text('\$${deposit.amount.toStringAsFixed(2)}'),
                                vGap(5)
                              ],
                            )
                          ],
                        )
                        // ListTile(
                        // leading: Container(
                        //     height: getHeight(context),
                        //     width: 20.w,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       color: tg2color,
                        //     ),
                        //     child: Icon(
                        //       Icons.person,
                        //       color: tgWhite,
                        //       size: 50,
                        //     )),
                        //   title:
                        // subtitle: Column(
                        //   children: [
                        //     Row(
                        //       children: [
                        //         Icon(
                        //           Icons.star_rounded,
                        //           color: Colors.yellow,
                        //           size: 20,
                        //         ),
                        //         Text("5.0"),
                        //         hGap(2),
                        //         Text("(520)"),
                        //       ],
                        //     ),
                        //     Row(
                        //       children: [
                        //         Container(
                        //             padding: EdgeInsets.all(2),
                        //             decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: tgWhite,
                        //                 border: Border.all(
                        //                     color: tglightGray, width: 1)),
                        //             child: Icon(
                        //               Icons.person,
                        //               color: tgred,
                        //               size: 20,
                        //             )),
                        //       ],
                        //     )
                        //   ],
                        // ),

                        //   //     ,
                        //   trailing: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Container(
                        //           padding: EdgeInsets.all(2),
                        //           decoration: BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               color: tgWhite,
                        //               border: Border.all(
                        //                   color: tglightGray, width: 1)),
                        //           child: Icon(
                        //             Icons.favorite,
                        //             color: tgred,
                        //             size: 15,
                        //           )),
                        //       Text('\$${deposit.amount.toStringAsFixed(2)}'),
                        //     ],
                        //   ),
                        // ),
                        );
                  }
                  return SizedBox.shrink();
                },
              );
            }),
          ),
        ),
        _submitButton(context)
      ],
    );
  }

  Future<void> _refreshList() async {
    // Simulate a refresh by delaying for a second
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Update the depositHistory list with the refreshed data
      depositHistory = [
        DepositItem(date: DateTime(2023, 9, 1), amount: 100.0),
        DepositItem(date: DateTime(2023, 8, 25), amount: 50.0),
        // Add more deposit items here
        // You should fetch data from your data source instead
      ];
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _submitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
          color: tgPrimaryColor,
          borderRadius: BorderRadius.circular(30),
          child: Text(
            'Submit',
            style: TextStyle(
                fontSize: isTab(context) ? 7.sp : 15.sp,
                fontWeight: FontWeight.w500,
                color: tgWhite),
          ),
          onPressed: () {}),
    );
  }
}
