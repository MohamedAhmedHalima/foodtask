import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/model/list_of_recipes_model.dart';
import 'package:foodtask/module/page/tabs/pages/item_details_screen/item_details_app_bar.dart';
import 'package:foodtask/module/page/tabs/pages/item_details_screen/item_details_item_text_info.dart';
import 'package:foodtask/shared/components/basic_elevated_button.dart';
import 'package:foodtask/shared/components/basic_text.dart';
import 'package:foodtask/shared/network/local/cache_helper.dart';
import 'package:foodtask/shared/resources/animation/fade_animation.dart';
import 'package:foodtask/shared/resources/animation/scale_animation.dart';
import 'package:foodtask/shared/resources/app_colors.dart';
import 'package:foodtask/utilities/navigator.dart';

class ItemDetailsScreen extends StatefulWidget {
  final ListOfRecipesModel itemModel;
  const ItemDetailsScreen({Key? key, required this.itemModel})
      : super(key: key);

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  late double _height;

  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);

  _navigateBack() async {
    await _animateContainerFromBottomToTop();
    Navigation.pop(context);
  }
  _animateContainerFromBottomToTop() async {
    //Animate back to default value
    _height = MediaQuery.of(context).padding.top + 50.h;
    setState(() {});
    //Wait till animation is finished
    await Future.delayed(_duration);
  }
  _animateContainerFromTopToBottom() async {
    //Wait
    await Future.delayed(_psudoDuration);

    //Animate from top to bottom
    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }
@override
  void initState() {
    // TODO: implement initState
  widget.itemModel.isFavorites!=null?null:widget.itemModel.isFavorites=false;

  super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Default height
    _height = MediaQuery.of(context).padding.top + 50.h;
    setState(() {});
    //Animate Container from Top to bottom
    _animateContainerFromTopToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: AnimatedContainer(
        height: _height,
        duration: _duration,
        padding: EdgeInsets.only(bottom: 10.h),
        curve: Curves.fastOutSlowIn,
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onBackTap: _navigateBack,
              ),
              SizedBox(
                height: 50.h * 7.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 0,
                      bottom: 0,
                      left: -160.w,
                      child: ScaleAnimation(
                        begin: 0,
                        duration: const Duration(milliseconds: 1000),
                        intervalStart: 0.2,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.network(
                            widget.itemModel.image ?? "",
                            width: 380.w,
                          ),
                        ),
                      ),
                    ),

                    //Food Info
                    Positioned.fill(
                      top: 40.h,
                      bottom: 0,
                      right: 32.w,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FadeAnimation(
                          duration: const Duration(milliseconds: 1250),
                          child: ScaleAnimation(
                            intervalStart: 0.4,
                            duration: const Duration(milliseconds: 1250),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ProductInfoText(
                                  text: 'Carbos',
                                  value: '${widget.itemModel.carbos}',
                                ),
                                ProductInfoText(
                                  text: 'Calories',
                                  value: '${widget.itemModel.calories}',
                                ),
                                ProductInfoText(
                                  text: 'Proteins',
                                  value: '${widget.itemModel.proteins}',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BasicText(
                        titleText: widget.itemModel.name ?? "",
                        style: Theme.of(context).textTheme.headline5),

                    SizedBox(height: 32.h),
                    BasicText(
                      titleText: widget.itemModel.description ?? "",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: AppColors.infoTextColor
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 40.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.cardColor,
                        ),
                        child: IconButton(
                          icon: !widget.itemModel.isFavorites!?Icon(
                            Icons.favorite_border,
                            color: AppColors.white  ,
                            size: 28.r,
                          ):Icon(
                            Icons.favorite,
                            color:  AppColors.red,
                            size: 28.r,
                          ),
                          onPressed: () {
                            setState(() {
                              for ( var  model in CacheHelper.listOfRecipesModel!) {
                                if (model.id == widget.itemModel.id) {
                                  model.isFavorites = !model.isFavorites!;
                                  widget.itemModel.isFavorites=model.isFavorites;
                                  CacheHelper.saveListOfRecipesModel(CacheHelper.listOfRecipesModel);
                                  break;
                                }
                              }
                             });
                          },
                        )),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: BasicElevatedButton(
                      buttonText: 'Add to Cart',
                      onTap: () {},
                      radius: 15.r,
                          color: AppColors.cardColor,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


