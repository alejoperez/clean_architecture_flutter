import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class AppScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget bodyWidget;

  const AppScaffold({@required this.appBarTitle, @required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(appBarTitle)),
        child: bodyWidget,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: bodyWidget,
    );
  }
}
