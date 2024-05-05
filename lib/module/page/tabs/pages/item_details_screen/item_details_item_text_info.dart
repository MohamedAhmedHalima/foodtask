import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/shared/resources/app_colors.dart';


class ProductInfoText extends StatelessWidget {
  const ProductInfoText({Key? key, required this.text, required this.value})
      : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
          Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp,color: AppColors.bodySmallTextColor),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headline6!.copyWith(
            fontSize: 16.sp,
            height: 1.5.h,
            color: AppColors.infoTextColor
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
