import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:formz/formz.dart';


abstract class StringValidator {
  bool isValid(String value);
}

class EmailValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value);
  }
}

class InputValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return RegExp(r"^([\u0600-\u06FF]+\s?)+$").hasMatch(value);
  }
}

class CheckIsPersianInputValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return RegExp(r"^([\u0600-\u06FF]+\s?)+$").hasMatch(value);
  }
}
class CheckIsEnglishInputValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return RegExp(r"/[^A-Za-z\s]/").hasMatch(value);
  }
}


class CheckIsNationalCodeValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isValidIranianNationalCode();
  }
}

class CheckIsPhoneNumberValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isValidIranianMobileNumber();
  }
}
class CheckIsEmptyValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isEmpty ? false : true;
  }
}

class InputValidators {
  final StringValidator emailValidator = EmailValidator();
  final StringValidator inputIsPersian = CheckIsPersianInputValidator();
  final StringValidator inputIsEnglish = CheckIsEnglishInputValidator();
  final StringValidator nationalCodeValidator = CheckIsNationalCodeValidator();
  final StringValidator phoneNumberValidator = CheckIsPhoneNumberValidator();
  final StringValidator emptyValidator = CheckIsEmptyValidator();
  final String invalidEmailErrorText = 'Email is wrong';
}



enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    return null;
  }
}


enum FamilyValidationError { empty }

class Family extends FormzInput<String, FamilyValidationError> {
  const Family.pure() : super.pure('');
  const Family.dirty([super.value = '']) : super.dirty();

  @override
  FamilyValidationError? validator(String value) {
    if (value.isEmpty) return FamilyValidationError.empty;
    return null;
  }
}


enum MobileValidationError { empty }

class Mobile extends FormzInput<String, MobileValidationError> {
  const Mobile.pure() : super.pure('');
  const Mobile.dirty([super.value = '']) : super.dirty();

  @override
  MobileValidationError? validator(String value) {
    if (value.isEmpty) return MobileValidationError.empty;
    return null;
  }
}