
# 🎯 Project Flutter 

This Flutter project is developed according to the provided project requirement. 

## 🗂 Features:

- Login with credentials configured with Firebase Auth
- Login with google sign-in configured with Firebase Auth and Google SignIn
- Sign up with credentials configured with Firebase Auth
- Home screen with required message i.e. "Hello, {email address}"
- Logout alert dialog
- Application gradient themed UI
- Support android and iOS

## 💻 Code Insights:

- [Used Barrel File - Import files like a pro](https://marketplace.visualstudio.com/items?itemName=miquelddg.dart-barrel-file-generator&ssr=false#overview)
- [Flutter's Favorite: flutter_bloc state management](https://pub.dev/packages/flutter_bloc)
- [Used Formz for input validations](https://pub.dev/packages/formz)
- Utilize the concepts of Clean Architecture, with data, presentation layers and respository. Project is currently excluded TDD.
- Utilize the concepts of SOLID Principles

## 🧮 Code Structure

```
📦lib
 ┣ 📂src
 ┃ ┣ 📂app_authentication
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┣ 📜authentication_bloc.dart
 ┃ ┃ ┃ ┣ 📜authentication_event.dart
 ┃ ┃ ┃ ┗ 📜authentication_state.dart
 ┃ ┃ ┗ 📜authentication.dart
 ┃ ┣ 📂config
 ┃ ┃ ┣ 📜config.dart
 ┃ ┃ ┣ 📜constants.dart
 ┃ ┃ ┗ 📜styles.dart
 ┃ ┣ 📂features
 ┃ ┃ ┣ 📂home
 ┃ ┃ ┃ ┣ 📂view
 ┃ ┃ ┃ ┃ ┣ 📜home_screen.dart
 ┃ ┃ ┃ ┃ ┗ 📜view.dart
 ┃ ┃ ┃ ┗ 📜home.dart
 ┃ ┃ ┣ 📂login
 ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┃ ┣ 📜login_bloc.dart
 ┃ ┃ ┃ ┃ ┣ 📜login_event.dart
 ┃ ┃ ┃ ┃ ┗ 📜login_state.dart
 ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┣ 📜model.dart
 ┃ ┃ ┃ ┃ ┣ 📜password.dart
 ┃ ┃ ┃ ┃ ┗ 📜useremail.dart
 ┃ ┃ ┃ ┣ 📂view
 ┃ ┃ ┃ ┃ ┣ 📜login_page.dart
 ┃ ┃ ┃ ┃ ┗ 📜view.dart
 ┃ ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┃ ┣ 📜google_login.dart
 ┃ ┃ ┃ ┃ ┣ 📜login_button.dart
 ┃ ┃ ┃ ┃ ┣ 📜login_form.dart
 ┃ ┃ ┃ ┃ ┣ 📜user_email.dart
 ┃ ┃ ┃ ┃ ┣ 📜user_password.dart
 ┃ ┃ ┃ ┃ ┗ 📜widgets.dart
 ┃ ┃ ┃ ┗ 📜login.dart
 ┃ ┃ ┗ 📂sign_up
 ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┃ ┣ 📜signup_bloc.dart
 ┃ ┃ ┃ ┃ ┣ 📜signup_event.dart
 ┃ ┃ ┃ ┃ ┗ 📜signup_state.dart
 ┃ ┃ ┃ ┣ 📂model
 ┃ ┃ ┃ ┃ ┣ 📜model.dart
 ┃ ┃ ┃ ┃ ┣ 📜password.dart
 ┃ ┃ ┃ ┃ ┗ 📜useremail.dart
 ┃ ┃ ┃ ┣ 📂view
 ┃ ┃ ┃ ┃ ┣ 📜sign_up_page.dart
 ┃ ┃ ┃ ┃ ┣ 📜sign_up_text.dart
 ┃ ┃ ┃ ┃ ┗ 📜view.dart
 ┃ ┃ ┃ ┣ 📂widgets
 ┃ ┃ ┃ ┃ ┣ 📜sign_up_button.dart
 ┃ ┃ ┃ ┃ ┣ 📜sign_up_form.dart
 ┃ ┃ ┃ ┃ ┣ 📜user_email.dart
 ┃ ┃ ┃ ┃ ┣ 📜user_password.dart
 ┃ ┃ ┃ ┃ ┗ 📜widgets.dart
 ┃ ┃ ┃ ┗ 📜sign_up.dart
 ┃ ┗ 📜.DS_Store
 ┣ 📜.DS_Store
 ┣ 📜app.dart
 ┣ 📜generated_plugin_registrant.dart
 ┗ 📜main.dart
```

## 🛡 Authentication Repository Structure

```
📦packages
 ┗ 📂authentication_repository
 ┃ ┣ 📂.dart_tool
 ┃ ┃ ┗ 📜package_config.json
 ┃ ┣ 📂lib
 ┃ ┃ ┣ 📂src
 ┃ ┃ ┃ ┗ 📜authentication_repository_base.dart
 ┃ ┃ ┗ 📜authentication_repository.dart
 ┃ ┣ 📂test
 ┃ ┃ ┗ 📜authentication_repository_test.dart
 ┃ ┣ 📜.gitignore
 ┃ ┣ 📜.packages
 ┃ ┣ 📜CHANGELOG.md
 ┃ ┣ 📜README.md
 ┃ ┣ 📜analysis_options.yaml
 ┃ ┣ 📜pubspec.lock
 ┃ ┗ 📜pubspec.yaml

 ```

## 📱 Demo

<img src="https://github.com/Insha-Siddiquii/flutter_project_evaluator/blob/master/video/project-flutter_.gif" width ="300"> 



