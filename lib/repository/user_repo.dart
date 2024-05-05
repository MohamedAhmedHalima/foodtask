
import 'package:dio/dio.dart';
import 'package:foodtask/api/api_path.dart';
import 'package:foodtask/api/api_service.dart';

class RecipesRepo {
  static Future<Response> getPlan() async {
    final Response<dynamic>? response =
        await ApiService.getApi(ApiPaths.listOfRecipes);
    return response!;
  }
}
