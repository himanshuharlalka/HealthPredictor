import 'package:flutter/material.dart';
import 'package:health_predictor/app_theme.dart';
import 'package:hexcolor/hexcolor.dart';

class NavigateButtons extends StatelessWidget {
  final String nextName;
  final String backName;
  final bool isFilled;
  final double height;
  final double width;
  final BuildContext context;
  final Function next;
  final Function back;

  NavigateButtons(
    this.nextName,
    this.backName,
    this.isFilled,
    this.height,
    this.width,
    this.context,
    this.next,
    this.back,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.fromLTRB(
          0.1 * width,
          height * 0.02,
          0.1 * width,
          height * 0.03,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                back();
              },
              child: Ink(
                height: 0.06 * height,
                width: 0.2 * width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    backName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: height * 0.025,
                    ),
                  ),
                ),
              ),
            ),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              child: InkWell(
                onTap: () {
                  if (isFilled) {
                    next();
                  }
                },
                child: Ink(
                  height: 0.06 * height,
                  width: 0.25 * width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    color: isFilled ? AppTheme.blue : HexColor("#E3E3E3"),
                  ),
                  child: Center(
                    child: Image.asset(
                      'lib/images/arrow.png',
                      color: isFilled ? AppTheme.white : AppTheme.darkerText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
