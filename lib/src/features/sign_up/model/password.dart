import 'package:flutter_dukkan_project/src/config/config.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError { empty, inValid }
//SOLID PRINCIPLE: Interface Segregation Principle: Both password and email validators are separately catered. Segration is done with a margin of login and sign up as well

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value!.isEmpty) {
      return PasswordValidationError.empty;
    } else if (!FieldsRegExp.passwordRegExp.hasMatch(value)) {
      return PasswordValidationError.inValid;
    }
    return null;
  }
}
