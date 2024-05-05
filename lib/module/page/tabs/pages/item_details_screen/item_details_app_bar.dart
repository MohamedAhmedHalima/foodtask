import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/module/page/tabs/pages/item_details_screen/item_details_screen.dart';
import 'package:foodtask/shared/components/basic_text.dart';
import 'package:foodtask/shared/resources/app_colors.dart';

import 'package:foodtask/utilities/navigator.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.title = '',
    this.isTitleCentered,
    this.actions,
    this.onBackTap,
  });

  ///Title of text
  final String title;

  ///Should the title be centered
  ///
  ///[Default is null]
  final bool? isTitleCentered;

  ///The widgets are rendered from end
  final List<Widget>? actions;

  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app_bar',
      child: Container(
        width: double.infinity,
        color: AppColors.scaffoldBackgroundColor,
        padding: EdgeInsets.only(
          top: 20.h,
          left: 16.w,
          right: 16.w,
          bottom: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                //Back Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: onBackTap ?? () => Navigation.pop(context),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        BasicText(
                          titleText: 'Back',
                          fontSize: 16.sp,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),

                //Main Heading and Title
                Align(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),

                //Actions
                const Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag,color: AppColors.white,)
                    ],
                  ),
                ),
              ],
            ),
            //Back Button
          ],
        ),
      ),
    );
  }
}
