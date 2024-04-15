import 'package:get/get.dart';
// import '../api/call.api.dart';
// import '../api/url.api.dart';

class LanguageUtil extends Translations {
  static Map<String, Map<String, String>> localData = {
    "en_IN": {
      "Translation": "Translation",
      "Hello": "Hello {name}",
    },
    "hi_IN": {
      "Translation": "अनुवाद",
      "Hello": "नमस्ते {name}",
    }
  };

  static void setDynamicName(String name) {
    localData.forEach((lang, translations) {
      translations.forEach((key, value) {
        translations[key] = value.replaceFirst("{name}", name);
      });
    });
  }

  @override
  Map<String, Map<String, String>> get keys => localData;

}
