import 'package:flutter/cupertino.dart';

class SlideRightPageRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightPageRoute({this.widget})
      : super(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation,
                Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              Animation<Offset> custom =
                  Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(animation);
              return SlideTransition(
                position: custom,
                child: child,
              );
              // ignore: missing_required_param
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return widget;
            });
}
