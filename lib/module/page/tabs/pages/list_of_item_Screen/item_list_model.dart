import 'package:flutter/material.dart';
import 'package:foodtask/model/list_of_recipes_model.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/module/page/tabs/pages/list_of_item_Screen/list_item_animation.dart';
import 'package:foodtask/shared/resources/app_colors.dart';


class ItemListModel extends StatefulWidget {
  final ListOfRecipesModel itemModel;
  const ItemListModel({super.key, required this.itemModel});

  @override
  State<ItemListModel> createState() => _ItemListModelState();
}

class _ItemListModelState extends State<ItemListModel> {
  @override
  Widget build(BuildContext context) {
    final playDuration = 600.ms;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200.h),
      child: Card(
        color: AppColors.cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             AnimatedImageWidget(
              imageUrl: widget.itemModel.image!,
              playDuration: playDuration,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 AnimatedFatsText(
                  playDuration: playDuration,
                  cal:  widget.itemModel.calories??"",
                  protein:widget.itemModel.proteins??"",
                ),
                 AnimatedNameWidget(
                    playDuration: playDuration, name: widget.itemModel.name??""),
                 AnimatedDescriptionWidget(
                    playDuration: playDuration,
                    description: widget.itemModel.headline??"")
              ],
            )
          ],
        ),
      ),
    );
  }
}
