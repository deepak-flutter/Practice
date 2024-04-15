import 'package:get/get.dart';

class FontFamilyUtil{
  static RxString fontFamily = 'Genos'.obs;

  onFontFamilyChange(String font){
    print(font);
    fontFamily.value = font;
  }
}