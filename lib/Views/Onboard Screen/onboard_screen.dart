import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learning_app/Views/Signin%20Screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Navigation Animation/tween_animation.dart';
import 'bloc/onboard_bloc.dart';
import 'onboard_screen_list.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardBloc, OnboardState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 350.w,
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.index = index;
                      BlocProvider.of<OnboardBloc>(context).add(OnboardEvent());
                    },
                    children: [
                      page(0, context, onboard_data),
                      page(1, context, onboard_data),
                      page(2, context, onboard_data),
                    ],
                  ),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.index,
                        dotsCount: 3,
                        decorator: DotsDecorator(
                            color: Colors.black.withOpacity(0.4),
                            activeColor: Colors.blue,
                            activeSize: Size(10, 10)),
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                  Positioned(
                    bottom: 40.h,
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
                      width: 325.w,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          if (state.index < 2) {
                            //next pageView
                            pageController.animateToPage(state.index + 1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                          } else {
                            //navigate to new page with tween animation
                            navigateWithTweenAnimation(context, const SigninScreen());
                          }
                        },
                        child: Center(
                            child: Text(
                          state.index < 2 ? "Next" : "Get Started",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget page(int index, BuildContext context, List<dynamic> onboard_data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(onboard_data[index]['image_path']),
        ),
        Container(
          child: Text(
            onboard_data[index]['title'],
            style: TextStyle(color: Colors.black, fontSize: 24.sp),
          ),
        ),
        Container(
          width: 300.w,
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            onboard_data[index]['subtitle'],
            style: TextStyle(
                color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
