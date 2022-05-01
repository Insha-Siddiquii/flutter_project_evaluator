import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:flutter_dukkan_project/src/features/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  Future<String?> _fetchUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  showLogoutDialog(BuildContext context) {
    Widget noButton = TextButton(
      child: const Text(
        AppConstants.no,
        style: TextStyle(color: AppColors.appPrimary),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = TextButton(
      child: const Text(
        AppConstants.yes,
        style: TextStyle(color: AppColors.appPrimary),
      ),
      onPressed: () {
        context.read<LoginBloc>().add(const LogOut());
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text(
        AppConstants.logout,
        style: TextStyle(color: AppColors.appBlack),
      ),
      content: const Text(
        AppConstants.logoutMsg,
        style: TextStyle(color: AppColors.appBlack),
      ),
      actions: [noButton, yesButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppColors.appPrimary,
                AppColors.appTertiary,
              ],
            ),
          ),
        ),
        title: const Text(
          AppConstants.home,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          BlocProvider(
            create: (context) {
              return LoginBloc(
                authenticationRepository:
                    RepositoryProvider.of<AuthenticationRepository>(context),
              );
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.password != current.password,
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    showLogoutDialog(context);
                  },
                );
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            FutureBuilder(
              future: _fetchUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.appSwatchTwo,
                    ),
                  );
                }
                return RichText(
                  text: TextSpan(
                    text: AppConstants.hello,
                    style: const TextStyle(
                        color: AppColors.appPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: ", ${snapshot.data}",
                        style: const TextStyle(
                          color: AppColors.appSwatchTwo,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
