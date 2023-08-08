import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget decorateTextFields(String fieldType, String? hintName,
      bool obscureText, void Function(String value) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldType),
        SizedBox(
          width: 325.w,
          height: 50.h,
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: hintName!,
              prefixIcon: fieldType=="Email"
                  ? const Icon(Icons.email)
                  : fieldType=="Phone"
                  ? const Icon(Icons.phone)
                  : const Icon(Icons.lock),
              fillColor: Colors.black.withOpacity(0.05),
              filled: true,
              focusColor: Colors.green,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              // color: Colors.black.withOpacity(0.1),
              //   borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        )
      ],
    );
  }