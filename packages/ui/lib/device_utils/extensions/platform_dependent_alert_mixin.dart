import 'package:flutter/material.dart';

import '../platform.dart';

mixin PlatformDependentAlert {
  void show(BuildContext context) {
    if (Platform.isIOS) {
      showIOS(context);
    } else if (Platform.isAndroid) {
      showAndroid(context);
    } else if (Platform.isWeb) {
      showWeb(context);
    } else {
      throw Exception('OS not supported');
    }
  }

  void showMobile(BuildContext context);

  void showAndroid(BuildContext context) => showMobile(context);

  void showIOS(BuildContext context) => showMobile(context);

  void showWeb(BuildContext context);
}
