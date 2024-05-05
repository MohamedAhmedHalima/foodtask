import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/module/Authentication/tabs/login_screen.dart';
import 'package:foodtask/module/page/bloc/get_list_of_recipes_bloc/get_list_of_recipes_bloc.dart';
import 'package:foodtask/module/page/tabs/pages/list_of_item_Screen/list_of_item_screen.dart';


import 'shared/resources/theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // The rest of your initialization code
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp( MyApp() );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (BuildContext context, Widget? widget) {
        return MultiBlocProvider(
          providers: [
             BlocProvider<GetListOfRecipesBloc>(create: (context) => GetListOfRecipesBloc(),),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: mainTheme,
            darkTheme: mainTheme,
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
             home: const LoginScreen(),

           ),
        );
      },
    );
  }
}
