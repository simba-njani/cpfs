// import 'package:first_app/base/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppDoubleText extends StatelessWidget {
  // ignore: use_super_parameters
  const AppDoubleText(
      {Key? key,
      required this.bigText,
      required this.smallText,
      required this.func})
      : super(key: key);
  final String bigText;
  final String smallText;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Color(0xFF3b3b3b)),
        ),
        InkWell(
          onTap: func,
          child: Text(
            smallText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
