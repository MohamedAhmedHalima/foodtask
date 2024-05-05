import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/shared/resources/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';


class BasicText extends StatelessWidget {
  String titleText;
  TextStyle ?style;
  double? fontSize;
  int? maxLines;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  bool needUnderLine;
  BasicText({Key? key, required this.titleText, this.fontSize, this.style,this.textAlign,this.maxLines,this.needUnderLine= false, this.fontWeight, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign:textAlign??TextAlign.start,
      titleText ,
      overflow: TextOverflow.visible,
      maxLines:maxLines,
      style:style?? GoogleFonts.poppins(
           decoration:needUnderLine? TextDecoration.underline:null,

          fontSize:fontSize?? 16.sp,
          fontWeight:fontWeight?? FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: color??AppColors.black),
    );
  }
}
