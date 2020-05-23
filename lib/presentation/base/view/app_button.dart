import 'package:universal_platform/universal_platform.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressedFunction;

  const AppButton({@required this.text, @required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isIOS) {
      return CupertinoButton(child: Text(text,style: TextStyle(color: Colors.white)), onPressed: onPressedFunction, color: Colors.deepOrange,);
    }
    if (UniversalPlatform.isAndroid) {
      return RaisedButton(child: Text(text, style: TextStyle(color: Colors.white)), onPressed: onPressedFunction, color: Colors.teal);
    }

    return RaisedButton(child: Text(text, style: TextStyle(color: Colors.white)), onPressed: onPressedFunction, color: Colors.purple);
  }
}
