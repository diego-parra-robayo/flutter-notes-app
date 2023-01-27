import 'package:flutter/material.dart';

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
