import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Item extends StatelessWidget {
  final String title;
  final String num;
  final String tem;
  const Item({
    Key? key,
    required this.title,
    required this.num,
    required this.tem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.acme(fontSize: 15.sp),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          num,
          style: GoogleFonts.abel(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          tem,
          style: GoogleFonts.acme(fontSize: 15.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
