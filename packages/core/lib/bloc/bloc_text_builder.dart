import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextBuilder<B extends Bloc<E, S>, E, S> extends StatefulWidget {
  final String Function(S state) converter;
  final E Function(String value) textChangedEventCreator;
  final Widget Function(BuildContext context, TextEditingController controller)
      builder;

  final TextEditingController? controller;

  const BlocTextBuilder({
    Key? key,
    required this.converter,
    required this.textChangedEventCreator,
    required this.builder,
    this.controller,
  }) : super(key: key);

  @override
  State<BlocTextBuilder<B, E, S>> createState() =>
      _BlocTextBuilderState<B, E, S>();
}

class _BlocTextBuilderState<B extends Bloc<E, S>, E, S>
    extends State<BlocTextBuilder<B, E, S>> {
  late B _bloc;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<B>();
    _controller = widget.controller ?? TextEditingController();

    //  Update bloc on every text change. Equivalent to onTextChanged in TextField
    _controller.addListener(() {
      _bloc.add(widget.textChangedEventCreator(_controller.text));
    });

    //  Update ui on every change from bloc
    _bloc.stream.map(widget.converter).listen((text) {
      if (_controller.text != text) {
        setState(() {
          _controller.text = text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }

  @override
  void dispose() {
    //  Dispose controller if it was created in this widget, otherwise keep it
    //  active as it could still be in use in a parent widget.
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
