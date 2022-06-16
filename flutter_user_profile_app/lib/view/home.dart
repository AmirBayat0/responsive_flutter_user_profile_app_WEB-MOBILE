import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  Home({required this.mobile, required this.web});
  final Widget mobile;
  final Widget web;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 501) {
        return mobile;
      } else {
        return web;
      }
    });
  }
}
