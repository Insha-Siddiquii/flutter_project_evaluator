// SOLID Principle: Single Responsibility principle, this class only responsible for the configuration of global app constants variants. Other classes also adopt the Single Responsibility principle.
class AppConstants {
  static const String welcome = "Welcome";
  static const String signInContinue = "Sign in to continue!";
  static const String signUpContinue = "Register & get started!";
  static const String emailId = "Email ID";
  static const String password = "Password";
  static const String login = "Login";
  static const String newUser = "I'm a new user, ";
  static const String signUp = "Sign Up";
  static const String home = "Home";
  static const String hello = "Hello";
  static const String loginWith = "or sign in with";
  static const String inProgressMessage = "Hi, this feature will soon provided";
  static const String emailRequired = "Email is required";
  static const String passwordRequired = "Password is required";
  static const String emailInvalid = "Invalid Email";
  static const String passwordInvalid = "Invalid Password";
  static const String yes = "Yes";
  static const String no = "No";
  static const String logout = "Logout";
  static const String logoutMsg = "Are you sure you want to logout?";
}

class AssetsConstants {
  static const String googleLogin = "assets/icons/google.png";
}

class FieldsRegExp {
  static final passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
}
