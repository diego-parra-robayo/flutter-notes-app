import 'package:auth/l10n/auth_localizations_extensions.dart';
import 'package:auth/presentation/connectors/sign_in_connector.dart';
import 'package:ui/widgets_base/custom_text_form_field.dart';
import 'package:auth/utils/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:ui/theme/ui.dart';

class SignInForm extends StatefulWidget {
  final void Function(SignInFormData data) onSignIn;

  const SignInForm({
    Key? key,
    required this.onSignIn,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isSignInButtonEnabled = false;

  late final Map<_SignInFormKeys, TextFormFieldValidationProps>
      _validationPropsMap;

  @override
  void initState() {
    super.initState();
    _validationPropsMap = {
      _SignInFormKeys.email: TextFormFieldValidationProps(
        validator: (input) =>
            FieldValidator.isValidEmail(input, context: context),
      ),
      _SignInFormKeys.password: TextFormFieldValidationProps(
        validator: (input) => FieldValidator.notEmpty(input, context: context),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        padding: EdgeInsets.all(UI.dimens.d16),
        child: Form(
          onChanged: () => setState(() {
            _isSignInButtonEnabled = _validationPropsMap.isValid();
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                label: '${context.l10nAuth.email}*',
                validationProps: _validationPropsMap[_SignInFormKeys.email]!,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: UI.dimens.d16),
              CustomTextFormField(
                label: '${context.l10nAuth.password}*',
                validationProps: _validationPropsMap[_SignInFormKeys.password]!,
                obscureText: true,
              ),
              SizedBox(height: UI.dimens.d16 * 2),
              ElevatedButton(
                onPressed: _isSignInButtonEnabled
                    ? () => widget.onSignIn(
                          SignInFormData(
                            email: _validationPropsMap.getText(
                              _SignInFormKeys.email,
                            )!,
                            password: _validationPropsMap.getText(
                              _SignInFormKeys.password,
                            )!,
                          ),
                        )
                    : null,
                child: Text(context.l10nAuth.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _validationPropsMap.disposeAllControllers();
    super.dispose();
  }
}

enum _SignInFormKeys { email, password }
