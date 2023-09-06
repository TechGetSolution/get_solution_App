import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart' hide Response;
import 'package:intl/intl.dart';
import '../../constants/color_constant.dart';
import '../../utils/display_utils.dart';

class DepositHistorPage extends StatefulWidget {
  const DepositHistorPage({super.key});

  @override
  State<DepositHistorPage> createState() => _DepositHistorPageState();
}

class _DepositHistorPageState extends State<DepositHistorPage> {
  // Set the default selected value here
  DateTime? selectedDate;
  List<DepositItem> depositHistory = [
    DepositItem(date: DateTime(2023, 9, 1), amount: 100.0),
    DepositItem(date: DateTime(2023, 8, 25), amount: 50.0),
    // Add more deposit items here
  ];
  List depositType = [
    "PayPal",
    "Credit or Debit Card",
    "UPI",
  ];
  List status = [
    "Paid",
    "Cancelled",
    "Pending",
  ];
  List statusColor = [
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
          'Add Deposit',
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
        Text(
          selectedDate == null
              ? 'Select a date to filter deposit history'
              : 'Deposit History for ${DateFormat('MMMM d, y').format(selectedDate!)}',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Deposit',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: _selectDate,
              child: Row(
                children: [
                  Text(selectedDate == null
                      ? 'Select Date'
                      : '${DateFormat('MMMM d, y').format(selectedDate!)}'),
                  selectedDate == null
                      ? Icon(Icons.arrow_drop_down)
                      : Container()
                ],
              ),

              // Row(
              //   children: [Text('Select Date'),x],
              // ),
            ),
          ],
        ),
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
                    return Card(
                      color: tgWhite,
                      child: ListTile(
                        leading: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: tgPrimaryColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.wallet_giftcard,
                              color: tgWhite,
                            )),
                        title: Text(depositType[index]),
                        subtitle:
                            Text(DateFormat('MMMM d, y').format(deposit.date)),

                        //     ,
                        trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$${deposit.amount.toStringAsFixed(2)}'),
                              vGap(10),
                              Text(
                                status[index],
                                style: TextStyle(
                                    color: statusColor[index],
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              );
            }),
          ),
        ),
        _submitBtn(context)
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
}

Widget _submitBtn(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: CupertinoButton(
        color: tgreen,
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

class DepositItem {
  final DateTime date;
  final double amount;

  DepositItem({required this.date, required this.amount});
}

extension DateTimeExtensions on DateTime {
  bool isSameDay(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
