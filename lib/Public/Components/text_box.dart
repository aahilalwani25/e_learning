import 'package:e_learning_app/Views/Signin%20Screen/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget decorateTextFields(BuildContext context, String fieldType,
    String? hintName, bool obscureText, void Function(String value) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(fieldType),
      SizedBox(
        width: 325.w,
        height: 50.h,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "$fieldType required";
            }

            if (fieldType == "Password" && value.length < 8) {
              return "Password must contains at least 8 characters";
            }

            if (fieldType == "Phone" && value.length < 9) {
              return "Phone number must contain at least 11 digits";
            }
            return null;
          },
          onChanged: onChanged,
          obscureText: BlocProvider.of<SigninBloc>(context).state.visibility,
          autocorrect: false,
          decoration: InputDecoration(
            suffixIcon: fieldType == "Password"
                ? InkWell(
                    onTap: () {
                      BlocProvider.of<SigninBloc>(context).add(
                          PasswordVisibilityChangedEvent(
                              !BlocProvider.of<SigninBloc>(context)
                                  .state
                                  .visibility));
                    },
                    child: BlocProvider.of<SigninBloc>(context).state.visibility
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null,
            hintText: hintName!,
            prefixIcon: fieldType == "Email"
                ? const Icon(Icons.email)
                : fieldType == "Phone"
                    ? const Icon(Icons.phone)
                    : fieldType == "Code"
                        ? const Icon(Icons.flag_rounded)
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
