import 'package:e_learning_app/Controllers/signin_controller.dart';
import 'package:e_learning_app/Navigation%20Animation/tween_animation.dart';
import 'package:e_learning_app/Public/Components/app_bar.dart';
import 'package:e_learning_app/Public/Components/error_snackbar.dart';
import 'package:e_learning_app/Views/Signin%20Screen/bloc/signin_bloc.dart';
import 'package:e_learning_app/Views/Signup%20Screen/signup_screen.dart';
import 'package:e_learning_app/Views/User%20Dashboard/user_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Public/Components/divider.dart';
import '../../Public/Components/social_icons.dart';
import '../../Public/Components/text_box.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form_key = GlobalKey<FormState>();
    return Scaffold(
        appBar: appBar("Log In"),
        body: WillPopScope(
          onWillPop: () async {
            //disable back button
            return false;
          },
          child: SingleChildScrollView(
            child: BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) => Form(
                key: form_key,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            socialIcons('google'),
                            socialIcons('apple'),
                            socialIcons('facebook')
                          ],
                        ),
                      ),

                      //container for text "Or use your  email account..."
                      Container(
                        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        child: Center(
                          child: Text(
                            'Or use your email account to login',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ),

                      //container for email and password text box
                      Container(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          margin: EdgeInsets.only(top: 80.h),
                          height: 220.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              decorateTextFields(
                                context,
                                  "Email", "abc@example.com", false, (value) {
                                BlocProvider.of<SigninBloc>(context)
                                    .add(EmailChangedEvent(value));
                              }),
                              decorateTextFields(
                                context,
                                  "Password", "Enter your Password", true,
                                  (value) {
                                BlocProvider.of<SigninBloc>(context)
                                    .add(PasswordChangedEvent(value));
                              }),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [rememberMe(), forgotPassword()],
                              ),
                            ],
                          )),

                      //login button
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        width: 325.w,
                        height: 50.h,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: const ContinuousRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                            onPressed: () async {
                              if (form_key.currentState!.validate()) {
                                String email =
                                    BlocProvider.of<SigninBloc>(context)
                                        .state
                                        .email;
                                String password =
                                    BlocProvider.of<SigninBloc>(context)
                                        .state
                                        .password;
                                SigninController signinController =
                                    SigninController(context: context);
                                signinController
                                    .handleSignin("email", email, password)
                                    .then((value) {
                                  if (value == null) {
                                    navigateWithTweenAnimation(
                                        context, const UserDashboardScreen());

                                    //print(value);
                                  } else {
                                    showError(context, value);
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.sp),
                            )),
                      ),

                      divider(),

                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have account? "),
                              InkWell(
                                onTap: () {
                                  navigateWithTweenAnimation(
                                      context, const SignupScreen());
                                },
                                child: Text(
                                  "Create New One",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget forgotPassword() {
    return GestureDetector(
      onTap: () {
        print("pressed");
      },
      child: Text(
        "Forgot Password",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15.sp),
      ),
    );
  }

  Widget rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text(
          "Remember Me",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15.sp),
        ),
      ],
    );
  }
}
