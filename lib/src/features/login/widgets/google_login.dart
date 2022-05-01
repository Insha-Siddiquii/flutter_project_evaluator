import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:flutter_dukkan_project/src/features/login/bloc/login_bloc.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.googleLoader
            ? const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: AppColors.appSwatchOne,
                ),
              )
            : SizedBox(
                width: 70,
                height: 70,
                child: IconButton(
                  icon: Image.asset(
                    AssetsConstants.googleLogin,
                  ),
                  onPressed: () {
                    context.read<LoginBloc>().add(const LoginWithGoogle());
                  },
                ),
              );
      },
    );
  }
}
