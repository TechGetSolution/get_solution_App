import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/color_constant.dart';
import '../../utils/display_utils.dart';

class AddDepositPage extends StatefulWidget {
  const AddDepositPage({super.key});

  @override
  State<AddDepositPage> createState() => _AddDepositPageState();
}

class _AddDepositPageState extends State<AddDepositPage> {
  String selectedPaymentMethod = 'Credit Card';
  String currency = 'USD'; // Set the default selected value here

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
          style: TextStyle(color: tgWhite, fontSize: 15.sp),
        ),
        centerTitle: true,
        backgroundColor: tgreen,
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              vGap(10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _paymentMethodDropDown(),
                      vGap(20),
                      _amtAndCurrencyWidget(),
                      vGap(30),
                      _charges(),
                    ],
                  ),
                ),
              ),
              vGap(30),
              _submitBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentMethodDropDown() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add a border
        borderRadius:
            BorderRadius.circular(5.0), // Optional: Add rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedPaymentMethod,
          onChanged: (String? newValue) {
            setState(() {
              selectedPaymentMethod = newValue.toString();
            });
          },
          items: <String>[
            'Credit Card',
            'PayPal',
            'Google Pay',
            'Apple Pay',
            'Other',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _amtAndCurrencyWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: '\$5000',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            ),
          ),
        ),
        SizedBox(
            width:
                10), // Add some spacing between the TextFormField and DropdownButton
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), // Add a border
              borderRadius:
                  BorderRadius.circular(5.0), // Optional: Add rounded corners
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currency,
                onChanged: (String? newValue) {
                  setState(() {
                    currency = newValue.toString();
                  });
                },
                items: <String>[
                  'USD',
                  'Rupee',
                  'BDT',
                  'Other',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _charges() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Charge           ',
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
              '10.00 USD',
              style: TextStyle(
                  fontSize: isTab(context) ? 7.sp : 12.sp,
                  fontWeight: FontWeight.w500,
                  color: tglightGray),
            ),
          ],
        ),
        vGap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Payable',
              style: TextStyle(
                  fontSize: isTab(context) ? 7.sp : 12.sp,
                  fontWeight: FontWeight.w500,
                  color: tgBlack),
            ),
            Text(
              ' :',
              style: TextStyle(
                  fontSize: isTab(context) ? 7.sp : 10.sp,
                  fontWeight: FontWeight.w700,
                  color: tglightGray),
            ),
            Text(
              '5010 USD',
              style: TextStyle(
                  fontSize: isTab(context) ? 7.sp : 12.sp,
                  fontWeight: FontWeight.w500,
                  color: tgBlack),
            ),
          ],
        ),
      ],
    );
  }

  Widget _submitBtn() {
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
