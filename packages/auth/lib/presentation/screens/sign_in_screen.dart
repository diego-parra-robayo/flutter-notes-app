import 'package:auth/presentation/connectors/sign_in_connector.dart';
import 'package:auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInConnector(
        builder: (context, onSignIn) => SignInForm(onSignIn: onSignIn),
      ),
    );
  }
}
