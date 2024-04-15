import 'app.const.dart';

class UrlApi{
  static const String baseUrl = AppConst.baseUrl;

  static const studentLogin = "$baseUrl/auth/login/student/";
  static const otpVerify = "$baseUrl/auth/login/verify-otp/";
  static const profileUpdate = "$baseUrl/auth/profile/student/";
  static const getAllPasses = "$baseUrl/payment/pass/all/";
  static const getAllCategory = "$baseUrl/exam/category/";
  static const getSubCategory = "$baseUrl/exam/sub-category/";
}