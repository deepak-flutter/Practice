class RegExHelper {
  static bool phoneNumber(String number) {
    return RegExp(r'^[6-9][0-9]{9}$').hasMatch(number);
  }

  static bool otp(String number) {
    return RegExp(r'^\d{6}$').hasMatch(number);
  }

  static bool name(String name) {
    return RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$').hasMatch(name);
  }

  static bool email(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  static bool city(String city) {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(city);
  }

  static String newsDescription(String description) {
    RegExp regex = RegExp(r'\.{3}');
    
    return description.replaceAll(regex, "");
  }
}
