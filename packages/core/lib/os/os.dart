import 'package:flutter/foundation.dart';

/// Custom class to check if the OS is Mobile or Web
class OS {
  static get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  static get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static get isMobile => isIOS || isAndroid;

  static get isWeb => !isMobile;
}