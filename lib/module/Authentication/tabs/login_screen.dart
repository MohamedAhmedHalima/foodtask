
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtask/module/page/tabs/pages/list_of_item_Screen/list_of_item_screen.dart';
import 'package:foodtask/shared/components/basic_TextField.dart';
import 'package:foodtask/shared/components/basic_elevated_button.dart';
import 'package:foodtask/shared/components/basic_password_TextField.dart';
import 'package:foodtask/shared/resources/animation/page_transition.dart';
import 'package:foodtask/shared/resources/app_colors.dart';
import 'package:foodtask/utilities/appvalidator.dart';
import 'package:foodtask/utilities/navigator.dart';



import '../../../shared/components/basic_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: formKey,
        child:Padding(
          padding:   EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 70.h,),
              Row(
                children: [
                  BasicText(
                    titleText: 'Hi There! 👋',
                    fontSize:24.sp ,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  BasicText(
                    titleText: 'Welcome back, Sign in to your account',
                    fontSize:14.sp ,
                    color: AppColors.white,
                   ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              BasicTextField(hintTitle: "email", textEditingController: phoneNumController,icon: Icons.email,
                  validation: (value) =>AppValidator.validatorEmail(value!, context) ,type: TextInputType.emailAddress),
              SizedBox(
                height: 10.h,
              ),BasicPasswordField(
                  validation: (value) =>
                      AppValidator.validatorPassword(value!, context),
                  textEditingController: passwordController,hintTitle: "Password"),
              Row(
                children: [
                  Checkbox(
                      value: isRememberMe,
                      onChanged: (value) {
                        setState(() {});
                        isRememberMe = value!;
                      },
                      side: const BorderSide(
                          color: AppColors.mainSimiBlue)),
                  BasicText(
                    titleText: ' remember me',
                    fontSize: 15.sp,
                    color: AppColors.infoTextColor,
                  ),
                  const Spacer(),

                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              BasicElevatedButton(
                  color: AppColors.cardColor,

                  onTap: () {
                    if (formKey.currentState!.validate() == true) {
                        Navigation.push(
                        context,
                        customPageTransition: PageTransition(
                          child:  const ListOfItemScreen(),
                          type: PageTransitionType.fadeIn,
                        ),
                      );

                    }
                  },
                  buttonText: "Login")

            ],
          ),
        ),
      ),
    );
  }
}
