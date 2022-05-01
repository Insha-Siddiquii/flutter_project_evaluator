import 'package:formz/formz.dart';

enum PasswordValidationError { empty }
//SOLID PRINCIPLE: Interface Segregation Principle: Both password and email validators are separately catered. Segration is done with a margin of login and sign up as well

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
