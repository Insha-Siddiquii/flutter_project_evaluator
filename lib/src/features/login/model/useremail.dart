import 'package:flutter_dukkan_project/src/config/constants.dart';
import 'package:formz/formz.dart';

enum UseremailValidationError { empty, inValid }

//SOLID PRINCIPLE: Interface Segregation Principle: Both password and email validators are separately catered. Segration is done with a margin of login and sign up as well
class Useremail extends FormzInput<String, UseremailValidationError> {
  const Useremail.pure() : super.pure('');
  const Useremail.dirty([String value = '']) : super.dirty(value);

  @override
  UseremailValidationError? validator(String? value) {
    if (value!.isEmpty) {
      return UseremailValidationError.empty;
    } else if (!FieldsRegExp.emailRegExp.hasMatch(value)) {
      return UseremailValidationError.inValid;
    }
    return null;
  }
}
