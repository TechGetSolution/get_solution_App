// import 'package:flutter/material.dart';
// import 'package:get_solution/constants/color_constant.dart';
// import 'package:sizer/sizer.dart';

// class OrderScreen extends StatefulWidget {
//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: tgWhite,
//         appBar: AppBar(
//           backgroundColor: tgWhite,

//           elevation: 0,
//           title: Text(
//             'Orders',
//             style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//           ),
//           centerTitle: true,
//           bottom: TabBar(
//               physics: ScrollPhysics(),
//               unselectedLabelColor: tglightGray,
//               indicatorSize: TabBarIndicatorSize.label,
//               unselectedLabelStyle: TextStyle(color: tgWhite),
//               labelColor: tgWhite,
//               indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: tgPrimaryColor),
//               tabs: [
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: tgPrimaryColor, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("Active"),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Colors.redAccent, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("Pending"),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Colors.redAccent, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("Completed"),
//                     ),
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(color: Colors.redAccent, width: 1)),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text("Cancelled"),
//                     ),
//                   ),
//                 ),
//               ]),

//           // bottom: TabBar(
//           //   controller: _tabController,
//           //   indicator: BoxDecoration(
//           //     color:
//           //         tgPrimaryColor, // Customize the selected tab indicator color here
//           //     borderRadius: BorderRadius.circular(20.0), // Make the tabs circular
//           //   ),

//           //   padding: EdgeInsets.all(10),
//           //   unselectedLabelColor:
//           //       tglightGray, // Customize the unselected tab text color
//           //   labelColor: tgWhite, // Customize the selected tab text color
//           //   tabs: [
//           //     Tab(text: 'Active'),
//           //     Tab(text: 'Pending'),
//           //     Tab(text: 'Completed'),
//           //     Tab(text: 'Cancelled'),
//           //   ],
//           // ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             // Add your content for the 'Active' tab here
//             Center(child: Text('Active Orders')),
//             // Add your content for the 'Pending' tab here
//             Center(child: Text('Pending Orders')),
//             // Add your content for the 'Completed' tab here
//             Center(child: Text('Completed Orders')),
//             // Add your content for the 'Cancelled' tab here
//             Center(child: Text('Cancelled Orders')),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:get_solution/utils/display_utils.dart';
import 'package:sizer/sizer.dart';

import '../../controller/order_controller.dart';

class OrderScreen extends StatelessWidget {
  final OrderController _orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tglightGray.withOpacity(0.20),
      appBar: AppBar(
        backgroundColor: tgPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Order',
          style: TextStyle(color: tgWhite, fontSize: 15.sp),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), // Adjust the radius as needed
            topRight: Radius.circular(40.0),
            // Adjust the radius as needed
          ),
          color: tgWhite,
        ),
        child: Column(
          children: [
            vGap(20),
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              controller: _orderController.tabController,
              indicatorColor: tgPrimaryColor,
              labelColor: tgPrimaryColor,
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Pending'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _orderController.tabController,
                children: [
                  TabContent(tabIndex: 0),
                  TabContent(tabIndex: 1),
                  TabContent(tabIndex: 2),
                  TabContent(tabIndex: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final int tabIndex;

  TabContent({required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      itemBuilder: (context, index) {
        return _cardItem();
      },
    );
  }

  Widget _cardItem() {
    return Center(
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Order ID',
                        style: TextStyle(color: tgBlack, fontSize: 12.sp),
                      ),
                      hGap(4),
                      Text(
                        '#02EF2G',
                        style: TextStyle(color: tgBlack, fontSize: 12.sp),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: tgPrimaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            "01",
                            style: TextStyle(
                                color: tgWhite, fontWeight: FontWeight.bold),
                          )),
                      hGap(5),
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: tgPrimaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            "01",
                            style: TextStyle(
                                color: tgWhite, fontWeight: FontWeight.bold),
                          )),
                      hGap(5),
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: tgPrimaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            "01",
                            style: TextStyle(
                                color: tgWhite, fontWeight: FontWeight.bold),
                          )),
                      hGap(5),
                      Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: tgPrimaryColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Text(
                            "01",
                            style: TextStyle(
                                color: tgWhite, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
              vGap(10),
              Row(
                children: [
                  Text(
                    "Seller :",
                    style: TextStyle(
                        color: tgGray,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                  Text(
                    "Shaidul Islam",
                    style: TextStyle(
                        color: tgBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                  hGap(2),
                  Text(
                    "|",
                    style: TextStyle(
                        color: tgBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                  hGap(3),
                  Text(
                    "24 Jun 2023",
                    style: TextStyle(
                        color: tgGray,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  )
                ],
              ),
              Divider(
                thickness: .5,
                color: tglightGray,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Titile    :',
                    style: TextStyle(color: tgGray, fontSize: 12.sp),
                  ),
                  hGap(6),
                  Expanded(
                    child: Text(
                      'Mobile UI UX design or app UI UX design',
                      style: TextStyle(
                          color: tgBlack,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
              vGap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration    :',
                    style: TextStyle(color: tgGray, fontSize: 12.sp),
                  ),
                  hGap(6),
                  Expanded(
                    child: Text(
                      '30',
                      style: TextStyle(
                          color: tgBlack,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
              vGap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount    :',
                    style: TextStyle(color: tgGray, fontSize: 12.sp),
                  ),
                  hGap(6),
                  Expanded(
                    child: Text(
                      '30',
                      style: TextStyle(
                          color: tgBlack,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
              vGap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status   :',
                    style: TextStyle(color: tgGray, fontSize: 12.sp),
                  ),
                  hGap(6),
                  Expanded(
                    child: Text(
                      'Active',
                      style: TextStyle(
                          color: tgBlack,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
