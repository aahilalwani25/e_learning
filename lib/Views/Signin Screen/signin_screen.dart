import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  Widget icons(String iconName) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/icons/$iconName.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        leadingWidth: 0,
        //backgroundColor: Colors.blue,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
        ),
        title: Text(
          'Log In',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          //disable back button
          return await false;
        },
        child: Container(
          width: 345.w,
          height: 100.h,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    icons('google'),
                    icons('apple'),
                    icons('facebook')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
