import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/device_utils/device_utils.dart';
import 'package:ui/theme/ui.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xffe5e5e5).withOpacity(0.25),
      alignment: Alignment.center,
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}

class LoadingAppBarWidget extends StatelessWidget with OSDependentWidget {
  const LoadingAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget buildCupertino(BuildContext context) {
    return _loadingAppBarContainer(
      child: CupertinoActivityIndicator(color: UI.colors.white),
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return _loadingAppBarContainer(
      child: CircularProgressIndicator(color: UI.colors.white),
    );
  }

  Widget _loadingAppBarContainer({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: child,
      ),
    );
  }
}
