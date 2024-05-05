import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_colors.dart';

class BasicPasswordField extends StatefulWidget {
  final String? title;
  final String? hintTitle;
  bool isObscure;
  Function? changeState;
  final GestureTapCallback? ontap;
  final ValueChanged<String>? onchange;
  final String? Function(String?)? validation;
  TextEditingController? textEditingController;

  BasicPasswordField(
      {this.title,
      this.ontap,
      this.onchange,
      this.validation,
      this.hintTitle,
      this.isObscure = true,
      required this.textEditingController,
      this.changeState,
      Key? key})
      : super(key: key);

  @override
  State<BasicPasswordField> createState() => _BasicPasswordFieldState();
}

class _BasicPasswordFieldState extends State<BasicPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0.h),
            child: Center(
              child: Text(
                widget.title!,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.simiBlack),
              ),
            ),
          ),
        SizedBox(
          // height: 40.h,
          child: TextFormField(
            // textAlignVertical: TextAlignVertical.bottom,
            onTap: widget.ontap,
            onChanged: widget.onchange,
            validator: widget.validation,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock,color: AppColors.mainDarkBlue),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0.r),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0.r),
                  borderSide: const BorderSide(color: AppColors.white)),
              filled: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 8.w),
              hintStyle: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.hintColor),
              hintText:  widget.hintTitle! ,

              fillColor: Colors.white,
              alignLabelWithHint: true,

              suffixIcon: widget.isObscure
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          widget.isObscure = false;
                        });

                        print(widget.isObscure.toString());
                      },
                      child: const Icon(Icons.remove_red_eye))
                  : InkWell(
                      onTap: () {
                        setState(() {
                          widget.isObscure = true;
                        });

                        print(widget.isObscure.toString());
                      },
                      child: const Icon(Icons.remove_red_eye_outlined)),
            ),
            obscureText: widget.isObscure,

            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff102132)
            ),
            controller: widget.textEditingController,
          ),
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}
