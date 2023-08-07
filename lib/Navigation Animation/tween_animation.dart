import 'package:flutter/material.dart';

void navigateWithTweenAnimation(BuildContext context, Widget pageNavigate) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) =>
              pageNavigate));
}
