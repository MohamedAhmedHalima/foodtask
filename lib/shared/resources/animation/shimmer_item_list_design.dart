import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerItemListDesign extends StatelessWidget {
  const ShimmerItemListDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200.h),
                child: Card(
                  child: Container(),
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(height: 0.h),
        itemCount: 10);
  }
}
