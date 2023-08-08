import 'package:e_learning_app/Public/Components/app_bar.dart';
import 'package:e_learning_app/Public/Components/social_icons.dart';
import 'package:e_learning_app/Public/Components/text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Sign up"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
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
                  'Or use your email account to sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                margin: EdgeInsets.only(top: 80.h),
                height: 300.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    decorateTextFields(
                        "Email", "abc@example.com", false, (value) {}),
                    decorateTextFields(
                        "Phone", "Enter your Phone Number", false, (value) {}),
                    decorateTextFields(
                        "Password", "Enter your Password", true, (value) {}),
                    decorateTextFields("Confirm Password",
                        "Enter your Confirm Password", true, (value) {}),
                  ],
                )),
      
            //login button
            SizedBox(
              //margin: EdgeInsets.only(left: 20.w),
              width: 325.w,
              height: 50.h,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  onPressed: () async {},
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
