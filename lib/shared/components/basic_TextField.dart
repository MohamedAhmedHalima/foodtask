import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/shared/components/basic_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_colors.dart';

class BasicTextField extends StatefulWidget {
  final String ?title;
  final String hintTitle;
  final String ?counterText;
  final bool titleInCenter;
  final TextInputType ?type;
  final bool readOnly;
  double? borderRadius;
  double? textSize;
  int? maxLines;
  int? minLines;
  double? heightInBottom;
  double? heightTextForm;
  Color ? fillColor;
  Color ? borderColor;
  Color ? titleColor;
  Color ? colorIcon;
  Color ? hintColor;
  final IconData ? icon;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onchange;
  final String? Function(String?)? validation;
  TextEditingController? textEditingController;
  final GlobalKey<FormState>? formKey;
  BasicTextField(
      {this.titleInCenter = false,
      this.readOnly = false,
      this.textAlign,
      this.title,
      this.maxLines=1,
      this.minLines=1,
      this.onTap,
      this.heightInBottom,
      this.textSize,
      this.icon,
      this.titleColor,
      this.counterText,
      this.onchange,
      this.borderColor,
      this.heightTextForm,
      this.validation,
      this.colorIcon,
      this.hintColor,
      this.fillColor,
      this.borderRadius,
      required this.hintTitle,
       this.type,
      required this.textEditingController,
      this.formKey,
      Key? key})
      : super(key: key);

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.title != null
            ? Padding(
            padding:
            EdgeInsets.symmetric(vertical: 2.0.h, horizontal: 5.w),
            child:BasicText(
             titleText:  widget.title! ,
              color: widget.titleColor,
              fontSize: widget.textSize,
            ))
            : Container(),
        SizedBox(
           height: widget.heightTextForm,
          child: TextFormField(
            maxLines:  widget.maxLines,
            minLines:  widget.minLines,
            onTap:widget.onTap ,
            readOnly: widget.readOnly,
             textAlignVertical: TextAlignVertical.bottom,
            onChanged: widget.onchange,
            decoration: InputDecoration(
              counterStyle:  const TextStyle(height: double.minPositive,color: AppColors.white),
              counterText:widget.counterText ,
              alignLabelWithHint: true,
              isDense: true,
              prefixIcon: widget.icon !=null? Icon(widget.icon,color:widget.colorIcon??AppColors.mainDarkBlue,size: 20.r):null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius??40.0.r),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius??40.0.r),
                  borderSide:  BorderSide(color:  widget.borderColor?? AppColors.white)),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
              filled: true,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color:widget.hintColor?? AppColors.hintColor),
              // suffix:  SizedBox(+
              //   width: 15.w,
              // ),
              hintText:  widget.hintTitle  ,
              fillColor: widget.fillColor??AppColors.white,
            ),
            validator: widget.validation,
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color:widget.titleColor?? const Color(0xff102132)
            ),
            key: widget.formKey,
            textAlign: widget.textAlign != null ?  widget.textAlign!:TextAlign.start,
            controller: widget.textEditingController,
            keyboardType: widget.type,
          ),
        ),
        SizedBox(
          height:widget.heightInBottom?? 5.h,
        )
      ],
    );
  }
}
