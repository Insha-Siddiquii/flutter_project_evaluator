import 'package:flutter/material.dart';
import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/view/view.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  // void _showInProgressMessage(BuildContext context) {
  //   const snackBar = SnackBar(
  //     content: Text(
  //       AppConstants.inProgressMessage,
  //       style: TextStyle(
  //         fontSize: 15,
  //       ),
  //     ),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(SignUpPage.route());
        },
        child: RichText(
          text: const TextSpan(
            text: AppConstants.newUser,
            style: TextStyle(color: AppColors.appSwatchTwo, fontSize: 18),
            children: [
              TextSpan(
                text: AppConstants.signUp,
                style: TextStyle(
                  color: AppColors.appPrimary,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
