 import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AnimatedFatsText extends StatelessWidget {
  final Duration playDuration;
  final String cal;
  final String protein;
  const AnimatedFatsText({
    Key? key,
    required this.playDuration,
    required this.cal,
    required this.protein,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Text("$cal \t\t\t\t$protein",
          style: Theme.of(context).textTheme.labelLarge //label medium
      )
          .animate()
          .scaleXY(
          begin: 0,
          end: 1,
          delay: 300.ms,
          duration: playDuration - 100.ms,
          curve: Curves.decelerate),
    );
  }
}

class AnimatedImageWidget extends StatelessWidget {
  final Duration playDuration;
  final String imageUrl;
  const AnimatedImageWidget({
    Key? key,
    required this.playDuration,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 150.h, maxWidth: 150.w),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ))
        .animate(delay: 400.ms)
        .shimmer(duration: playDuration - 200.ms)
        .flip();
  }
}

class AnimatedNameWidget extends StatelessWidget {
  final Duration playDuration;
  final String name;
  const  AnimatedNameWidget({
    Key? key,
    required this.playDuration,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 150.w),
      alignment: Alignment.centerLeft,
      child: Text(name,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          softWrap: true,
          style: Theme.of(context).textTheme.titleLarge //title large
      )
          .animate()
          .fadeIn(
          duration: 300.ms, delay: playDuration, curve: Curves.decelerate)
          .slideX(begin: 0.2, end: 0),
    );
  }
}

class  AnimatedDescriptionWidget extends StatelessWidget {
  final Duration playDuration;
  final String description;
  const AnimatedDescriptionWidget({
    Key? key,
    required this.playDuration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 10, left: 5, bottom: 10),
      constraints: BoxConstraints(maxWidth: 150.w),
      child: Text(description,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          softWrap: true,
          style: Theme.of(context).textTheme.labelMedium //label large
      )
          .animate()
          .scaleXY(
          begin: 0,
          end: 1,
          delay: 300.ms,
          duration: playDuration - 100.ms,
          curve: Curves.decelerate),
    );
  }
}
