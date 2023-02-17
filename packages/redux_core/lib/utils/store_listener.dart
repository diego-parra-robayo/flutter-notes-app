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

  //  TODO: Check if this can be improved without rebuilding the child
  @override
  Widget build(BuildContext context) {
    return StoreConnector<S, VM>(
      distinct: true,
      converter: converter,
      rebuildOnChange: true,
      builder: (context, _) => child ?? const SizedBox.shrink(),
      onWillChange: (_, vm) => listener(context, vm),
    );
  }
}
