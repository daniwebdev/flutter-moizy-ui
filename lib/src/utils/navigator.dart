import 'package:flutter/material.dart';

/* Navigation */
go(context, {to, String? transition}) {
  if (transition == 'slide_from_bottom') {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => to,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  } else {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => to,
      ),
    );
  }
}
