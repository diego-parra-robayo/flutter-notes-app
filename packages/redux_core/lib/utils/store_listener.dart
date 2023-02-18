import 'package:flutter/material.dart';

import '../redux_core.dart';

class StoreListener<S, VM> extends StatelessWidget {
  final VM Function(Store<S> store) converter;
  final void Function(BuildContext context, VM vm) listener;
  final Widget? child;

  const StoreListener({
    Key? key,
    required this.converter,
    required this.listener,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<S, VM>(
      distinct: true,
      converter: converter,
      //  rebuildOnChange needs to be set to true in order to trigger onWillChange
      rebuildOnChange: true,
      onWillChange: (_, vm) => listener(context, vm),
      builder: (context, _) => child ?? const SizedBox.shrink(),
    );
  }
}
