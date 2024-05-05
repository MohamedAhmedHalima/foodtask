import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodtask/model/list_of_recipes_model.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtask/module/page/bloc/get_list_of_recipes_bloc/get_list_of_recipes_bloc.dart';
import 'package:foodtask/module/page/tabs/pages/item_details_screen/item_details_screen.dart';
import 'package:foodtask/module/page/tabs/pages/list_of_item_Screen/item_list_model.dart';
import 'package:foodtask/shared/network/local/cache_helper.dart';
import 'package:foodtask/shared/resources/animation/page_transition.dart';
import 'package:foodtask/shared/resources/animation/shimmer_item_list_design.dart';
import 'package:foodtask/shared/resources/app_colors.dart';
import 'package:foodtask/utilities/navigator.dart';

class ListOfItemScreen extends StatefulWidget {
  const ListOfItemScreen({super.key});

  @override
  State<ListOfItemScreen> createState() => _ListOfItemScreenState();
}

class _ListOfItemScreenState extends State<ListOfItemScreen> {
  late GetListOfRecipesBloc getListOfRecipesBloc;
  late double _height;
  late List<ListOfRecipesModel> listOfRecipesModel;

  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);

  _navigate(final ListOfRecipesModel itemModel) async {
    //Animate screen container from bottom to top
    await _animateContainerFromBottomToTop();
    await Navigation.push(
      context,
      customPageTransition: PageTransition(
        child: ItemDetailsScreen(itemModel: itemModel),
        type: PageTransitionType.fadeIn,
      ),
    );
    await _animateContainerFromTopToBottom();
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
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Default height
    _height = 0;
    setState(() {});

    //Animate Container from Top to bottom
    Timer(const Duration(milliseconds: 50), () {
      _animateContainerFromTopToBottom();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    CacheHelper.getListOfRecipesModel();
    getListOfRecipesBloc = BlocProvider.of<GetListOfRecipesBloc>(context);
    getListOfRecipesBloc.add(GetListOfRecipes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: AnimatedContainer(
        height: _height,
        duration: _duration,
        padding: EdgeInsets.only(bottom: 20.h),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
        ),
        child: BlocBuilder<GetListOfRecipesBloc, GetListOfRecipesState>(
          builder: (BuildContext context, state) {
            if (state is GetListOfRecipesSuccess) {
              if(CacheHelper.listOfRecipesModel==null){
                  CacheHelper.saveListOfRecipesModel(state.listOfRecipesModel);
                  listOfRecipesModel=state.listOfRecipesModel;
              }else{
                listOfRecipesModel =CacheHelper.listOfRecipesModel!;
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _navigate(listOfRecipesModel[index]),
                    child: ItemListModel(
                            itemModel: listOfRecipesModel[index])
                        .animate()
                        .slideX(
                            duration: 200.ms,
                            delay: 0.ms,
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutSine),
                  );
                },
                itemCount: listOfRecipesModel.length,
              );
            } else {
              return const ShimmerItemListDesign();
            }
          },
        ),
      ),
    );
  }
}
