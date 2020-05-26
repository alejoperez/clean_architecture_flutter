import 'package:clean/presentation/base/app/app_localizations.dart';
import 'package:clean/presentation/base/view/app_button.dart';
import 'package:clean/presentation/base/view/app_progress_indicator.dart';
import 'package:clean/presentation/base/view/app_scaffold.dart';
import 'package:clean/presentation/base/view_model/base_view_model.dart';

import 'login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: AppLocalizations.of(context).translate('login_text_button'),
      bodyWidget: Center(
        child: Consumer<LoginViewModel>(builder: (ctx, loginViewModel, _) {
          switch (loginViewModel.state) {
            case ViewState.Waiting:
              return AppProgressIndicator();
            case ViewState.Done:
              if (loginViewModel.loginEvent.result == EventResult.Success) {
                final successEvent = loginViewModel.loginEvent as SuccessEvent;
                return Text("Success: ${successEvent.data.toString()}");
              }
              final failureEvent = loginViewModel.loginEvent as FailureEvent;
              return Text("Failure: ${failureEvent.error}");
            default:
              return AppButton(
                text: AppLocalizations.of(context).translate('login_text_button'),
                onPressedFunction: () {
                  Provider.of<LoginViewModel>(context, listen: false).login("email", "password");
                },
              );
          }
        }),
      ),
    );
  }
}
