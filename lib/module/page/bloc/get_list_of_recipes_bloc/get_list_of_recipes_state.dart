part of 'get_list_of_recipes_bloc.dart';

abstract class GetListOfRecipesState {}
class GetListOfRecipesInitial extends GetListOfRecipesState {}

class GetListOfRecipesSuccess extends GetListOfRecipesState {
  final List<ListOfRecipesModel> listOfRecipesModel;
  GetListOfRecipesSuccess({required this.listOfRecipesModel});
}
class GetListOfRecipesLoading extends GetListOfRecipesState {}


class GetListOfRecipesFailed extends GetListOfRecipesState {
  final String error;
  GetListOfRecipesFailed({required this.error});
}
class ConnectionError extends GetListOfRecipesState {}