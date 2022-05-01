import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/bloc/signup_bloc.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColors.appPrimary,
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            return SignUpBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: ListView(
            padding: const EdgeInsets.only(
              left: 20,
              top: 12,
              right: 20,
            ),
            children: const [
              Text(
                AppConstants.welcome + ',',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.appBlack,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppConstants.signUpContinue,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appSwatchTwo,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SignUpBody(),
            ],
          ),
        ),
      ),
    );
  }
}
