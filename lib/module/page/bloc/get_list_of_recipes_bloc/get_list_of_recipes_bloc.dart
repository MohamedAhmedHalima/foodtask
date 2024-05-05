import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtask/model/list_of_recipes_model.dart';
import 'package:foodtask/repository/user_repo.dart';

part 'get_list_of_recipes_event.dart';
part 'get_list_of_recipes_state.dart';

class GetListOfRecipesBloc
    extends Bloc<GetListOfRecipesEvent, GetListOfRecipesState> {
  GetListOfRecipesBloc() : super(GetListOfRecipesInitial()) {
    on<GetListOfRecipes>((event, emit) async {
      emit(GetListOfRecipesLoading());
      try {
        Response<dynamic> response = await RecipesRepo.getPlan();
        if (response.statusCode == 200) {
          List<ListOfRecipesModel> list = List<ListOfRecipesModel>.from(
              response.data.map((value) => ListOfRecipesModel.fromJson(value)));

          emit(GetListOfRecipesSuccess(listOfRecipesModel: list));
        } else {
          emit(GetListOfRecipesFailed(error: response.data!));
        }
      } on DioError catch (e) {
        print(e);
        if (e.message!.contains('SocketException')) {
          emit(ConnectionError());
        } else {
          emit(GetListOfRecipesFailed(error: e.message!));
        }
      } catch (e) {
        if (e is SocketException) {
          emit(ConnectionError());
        } else {
          emit(GetListOfRecipesFailed(error: e.toString()));
        }
      }
    });
  }
}
