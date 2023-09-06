import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/color_constant.dart';
import '../../../utils/display_utils.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String selectedPaymentMethod = 'Non original content';
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
          'Report',
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
                      _sellerProfileUrl(),
                      vGap(20),
                      _whyWantReport(),
                      vGap(20),
                      _urlOriginalContent(),
                      vGap(20),
                      _additionalInfo()
                    ],
                  ),
                ),
              ),
              vGap(30),
              Row(
                children: [
                  Expanded(child: _cancelBtn()),
                  hGap(20),
                  Expanded(child: _sendBtn()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _whyWantReport() {
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
            'Non original content',
            'Trademark Violations',
            'Copyright Violations',
            'Other reasons',
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

  Widget _sellerProfileUrl() {
    return SizedBox(
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Seller Profile URL',
            hintText: 'Enter seller profile url',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      ),
    );
  }

  Widget _urlOriginalContent() {
    return SizedBox(
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Url of original content',
            hintText: 'Enter post url',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      ),
    );
  }

  Widget _additionalInfo() {
    return SizedBox(
      child: TextFormField(
        maxLines: 3,
        decoration: InputDecoration(
            labelText: 'Additional Information',
            hintText: 'Enter Information...',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
      ),
    );
  }

  Widget _sendBtn() {
    return SizedBox(
      height: 50,
      child: CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: tgPrimaryColor,
          borderRadius: BorderRadius.circular(30),
          child: Text(
            'Send',
            style: TextStyle(
                fontSize: isTab(context) ? 7.sp : 15.sp,
                fontWeight: FontWeight.w500,
                color: tgWhite),
          ),
          onPressed: () {}),
    );
  }

  Widget _cancelBtn() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: tgPrimaryColor)),
      child: CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Cancel',
            style: TextStyle(
                fontSize: isTab(context) ? 7.sp : 15.sp,
                fontWeight: FontWeight.w500,
                color: tgPrimaryColor),
          ),
          onPressed: () {}),
    );
  }
}
