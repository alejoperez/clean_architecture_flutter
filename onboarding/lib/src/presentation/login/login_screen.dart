import 'login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (ctx, loginViewModel, textButton) {
            if(loginViewModel.viewState == ViewState.Idle) {
              return RaisedButton(
                child: textButton,
                onPressed: () {
                  Provider.of<LoginViewModel>(context, listen: false).login("email", "password");
                },
              );
            }

            if(loginViewModel.viewState == ViewState.Loading) {
              return CircularProgressIndicator();
            }

            if(loginViewModel.viewState == ViewState.Failure) {
              return Text("Failure");
            }

            return Text("Success");
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
