import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class AppProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(UniversalPlatform.isIOS) {
      return CupertinoActivityIndicator();
    }
    return CircularProgressIndicator();
  }
}
