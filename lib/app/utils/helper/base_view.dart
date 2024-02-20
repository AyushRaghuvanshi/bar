import 'package:flutter/material.dart';

///[BaseView] is a overlying stateless widget for all view.
class BaseView extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appbar;
  const BaseView({super.key, required this.child, this.appbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: SingleChildScrollView(child: child)),
      )),
    );
  }
}
