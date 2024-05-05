// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cleanmachine/model/user_model.dart';
// import 'package:cleanmachine/shared/network/local/cache_helper.dart';
//
// part 'auth_status_event.dart';
// part 'auth_status_state.dart';
//
// class UserAuthStatusBloc
//     extends Bloc<UserAuthStatusEvent, UserAuthStatusState> {
//   late UserModel? user;
//
//   UserAuthStatusBloc() : super(UserAuthStatusInitial()) {
//     on<AppStarted>((AppStarted event, Emitter<UserAuthStatusState> emit) async {
//       user = await CacheHelper.getUser();
//
//       if(user != null){
//         emit (UserAuthStatusAuthenticated(user: user!));
//       } else {
//         emit (UserAuthStatusUnAuthenticated());
//       }
//     });
//     on<LogOUt>((LogOUt event, Emitter<UserAuthStatusState> emit) async {
//       emit(UserAuthStatusLoading());
//       user = null;
//       await CacheHelper.deleteUser();
//       emit(UserAuthStatusUnAuthenticated());
//     });
//   }
// }