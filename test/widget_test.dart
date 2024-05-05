import 'package:flutter_test/flutter_test.dart';
import 'package:foodtask/module/page/bloc/get_list_of_recipes_bloc/get_list_of_recipes_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';


 class MockGetListOfRecipesBloc extends MockBloc<GetListOfRecipesEvent, GetListOfRecipesState>
    implements GetListOfRecipesBloc {}

void main() {
  group('GetListOfRecipesBloc', () {
     late GetListOfRecipesBloc getListOfRecipesBloc;

    setUp(() {
      getListOfRecipesBloc = MockGetListOfRecipesBloc();
    });

    tearDown(() {
      getListOfRecipesBloc.close();
    });

    test('initial state is GetListOfRecipesInitial', () {
      expect(getListOfRecipesBloc.state, equals(GetListOfRecipesInitial()));
    });

    blocTest<GetListOfRecipesBloc, GetListOfRecipesState>(
      'emits [GetListOfRecipesLoading, GetListOfRecipesSuccess] when GetListOfRecipes event is added and data is successfully fetched',
      build: () {
        when(() => getListOfRecipesBloc.add(GetListOfRecipes())).thenReturn(null);
        return getListOfRecipesBloc;
      },
      act: (bloc) => bloc.add(GetListOfRecipes()),
      expect: () => [
        GetListOfRecipesLoading(),
        GetListOfRecipesSuccess(listOfRecipesModel: any(named: 'listOfRecipesModel')),
      ],
    );

    blocTest<GetListOfRecipesBloc, GetListOfRecipesState>(
      'emits [GetListOfRecipesLoading, GetListOfRecipesFailed] when GetListOfRecipes event is added and there\'s an error',
      build: () {
        when(() => getListOfRecipesBloc.add(GetListOfRecipes())).thenReturn(null);
        return getListOfRecipesBloc;
      },
      act: (bloc) {
        // Simulate an error by emitting GetListOfRecipesFailed
        bloc.add(GetListOfRecipesFailed(error: 'An error occurred') as GetListOfRecipesEvent);
      },
      expect: () => [
        GetListOfRecipesLoading(),
        GetListOfRecipesFailed(error: 'An error occurred'),
      ],
    );

    // Test other scenarios similarly
  });
}
