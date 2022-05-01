import 'package:flutter/material.dart';
import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/widgets/widgets.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  FocusNode _emailFocusNode = FocusNode();
  final Color _emailColor = AppColors.appFocusField;
  late Color _pswdColor = AppColors.appFocusField;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 45,
              bottom: 10,
            ),
            child: UserEmailInput(
              emailFocusNode: _emailFocusNode,
              emailColor: _emailColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Focus(
              onFocusChange: (focusChange) {
                setState(
                  () {
                    _pswdColor = focusChange
                        ? AppColors.appPrimary
                        : AppColors.appFocusField;
                  },
                );
              },
              child: UserPasswordInput(pswdColor: _pswdColor),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const SignUpButton()
        ],
      ),
    );
  }
}
