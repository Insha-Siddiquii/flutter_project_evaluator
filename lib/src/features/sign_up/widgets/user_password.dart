import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/bloc/signup_bloc.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/model/model.dart';

class UserPasswordInput extends StatefulWidget {
  const UserPasswordInput({
    Key? key,
    required Color pswdColor,
  })  : _pswdColor = pswdColor,
        super(key: key);

  final Color _pswdColor;

  @override
  State<UserPasswordInput> createState() => _UserPasswordInputState();
}

class _UserPasswordInputState extends State<UserPasswordInput> {
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('SignUpPage_passwordInput_textField'),
          keyboardType: TextInputType.text,
          cursorWidth: 1,
          style: const TextStyle(
            color: AppColors.appFocusField,
            fontSize: 13,
          ),
          onChanged: (password) =>
              context.read<SignUpBloc>().add(SignUpPasswordChanged(password)),
          obscureText: _obscured ? true : false,
          cursorColor: AppColors.appTertiary,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: GestureDetector(
                onTap: _toggleObscured,
                child: Icon(
                  _obscured
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  size: 20,
                  color: AppColors.appTertiary,
                ),
              ),
            ),
            errorText: !(state.password.pure)
                ? state.password.error == PasswordValidationError.empty
                    ? AppConstants.passwordRequired
                    : state.password.error == PasswordValidationError.inValid
                        ? AppConstants.passwordInvalid
                        : null
                : null,
            focusColor: AppColors.appTertiary,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.appTertiary,
              ),
            ),
            labelText: AppConstants.password,
            labelStyle: TextStyle(
              color: widget._pswdColor,
              fontSize: 13,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.appFocusField,
              ),
            ),
          ),
        );
      },
    );
  }
}
