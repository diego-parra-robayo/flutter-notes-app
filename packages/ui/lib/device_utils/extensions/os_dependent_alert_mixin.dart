import 'package:flutter/material.dart';

import '../os.dart';

mixin OSDependentAlert {
  void show(BuildContext context) {
    if (OS.isCupertino) {
      showCupertino(context);
    } else if (OS.isMaterial) {
      showMaterial(context);
    } else {
      throw Exception('OS not supported');
    }
  }

  void showCupertino(BuildContext context);

  void showMaterial(BuildContext context);
}