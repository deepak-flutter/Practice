
import 'dart:io';

class AdMobService {
  static String get bannerAdUnitId {
    if(Platform.isAndroid) {
      return 'ca-app-pub-8734787567422661~2032604411';
    }
    else if(Platform.isIOS) {
      return '';
    }
    else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if(Platform.isAndroid) {
      return 'ca-app-pub-8734787567422661~2032604411';
    }
    else if(Platform.isIOS) {
      return '';
    }
    else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if(Platform.isAndroid) {
      return 'ca-app-pub-8734787567422661~2032604411';
    }
    else if(Platform.isIOS) {
      return '';
    }
    else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedInterstitialAdUnitId {
    if(Platform.isAndroid) {
      return 'ca-app-pub-8734787567422661~2032604411';
    }
    else if(Platform.isIOS) {
      return '';
    }
    else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get nativeAdUnitId {
    if(Platform.isAndroid) {
      return 'ca-app-pub-8734787567422661~2032604411';
    }
    else if(Platform.isIOS) {
      return '';
    }
    else {
      throw UnsupportedError('Unsupported platform');
    }
  }

}