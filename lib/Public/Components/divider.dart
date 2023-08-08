import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget divider() {
    return //Divider Replacement
        Container(
      margin: EdgeInsets.only(top: 50.h),
      child: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.grey,
          height: 1,
        ),
      ),
    );
  }