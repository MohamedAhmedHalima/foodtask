// import 'dart:async';
//
// import 'package:animations/animations.dart';
// import 'package:cleanmachine/module/page/tabs/shared_desigen/bottom_navigation.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:cleanmachine/module/Authentication/bloc/auth_state_bloc/auth_status_bloc.dart';
// import 'package:cleanmachine/module/Authentication/tabs/login_screen.dart';
// import 'package:cleanmachine/shared/components/basic_alert_dialog.dart';
// import 'package:cleanmachine/shared/resources/app_images.dart';
//
//
// import '../../../shared/components/system_ui_overlay_styles.dart';
// import '../../../shared/network/local/cache_helper.dart';
// import '../../../shared/resources/app_colors.dart';
//
//
//
// class SplashScreen extends StatefulWidget {
//   const  SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   Widget? view;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//
//     _animation = Tween<double>(begin: 0, end: 2).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInCirc, // You can experiment with different curves
//       ),
//     );
//
//     _controller.forward();
//     SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyles.lightStatusBarStyle);
//
//     Future.delayed(const Duration(milliseconds: 1000)).then((value) {
//       // CacheHelper.setIsFirstTime(true).then((value) {});
//
//       BlocProvider.of<UserAuthStatusBloc>(context)
//           .stream
//           .listen((UserAuthStatusState state) async {
//         if (state is UserAuthStatusAuthenticated) {
//           print("isRememberMe${CacheHelper.isRememberMe!}");
//           if(CacheHelper.isRememberMe!){
//             setState(() {
//               mainAlertDialog(
//                   context: context,
//                   alertContent: "برجاء العلم ان النسخه الحاله من التطبيق تحت الاختبار شكرا لوقتكم الثمين",
//                   alertCircleColor: alertType[2].alertColor,
//                   alertCircleIcon: alertType[2].icon);
//               view =  BasicBottomNavigator();
//             });
//           }else{
//             setState(() {
//                CacheHelper.deleteUser();
//               view = const LoginScreen();
//             });
//           }
//         }
//         else if (state is UserAuthStatusUnAuthenticated) {
//           setState(() {
//              CacheHelper.deleteUser();
//             view = const LoginScreen();
//           });
//         }
//       });
//     });
//     }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//
//     return PageTransitionSwitcher(
//         duration: const Duration(milliseconds: 500),
//         transitionBuilder: (
//             Widget child,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             ) {
//           return child;
//         },
//         child: view ??
//             Scaffold(
//               body:  Container(
//                 width: size.width,
//                 height: size.height,
//                 color: AppColors.lightBlack,
//                 child: Center(
//                     child: AnimatedBuilder(
//                         animation: _animation,
//                         builder: (context, child) {
//                           return Transform.scale(
//                             scale: 2 + (_animation.value * 0.5),
//                             child: Text(
//                               'Clean Machine',
//                               style: TextStyle(
//                                 fontSize: 25.sp,
//                                 color: AppColors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );})),
//               ),
//             )
//     );
//   }
// }
