import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_solution/constants/color_constant.dart';
import 'package:get_solution/utils/display_utils.dart';

class TGButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color color;
  final Color loaderColor;

  TGButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.color = Colors.blue,
    this.loaderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) / 1.2,
      child: CupertinoButton(
        minSize: 45,
        color: tgPrimaryColor,
        onPressed: isLoading ? null : onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !isLoading,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: SpinKitThreeBounce(
                color: loaderColor,
                size: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
