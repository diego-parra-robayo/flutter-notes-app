import 'package:flutter/material.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/redux_core.dart';
import 'package:ui/alerts/custom_snackbar.dart';
import 'package:ui/widgets_app/loading_widget.dart';
import 'package:ui/widgets_base/widget_connector.dart';

import '../theme/ui.dart';

class ResourceConnector<S, VM> extends StatefulWidget {
  final void Function(Store<S> store)? onInit;
  final bool Function(S state)? loadingSelector;
  final Widget? Function(BuildContext context, bool isLoading)? loadingBuilder;
  final Failure? Function(S state)? popUpFailureSelector;
  final void Function(BuildContext context, Failure? message)?
      popUpFailureListener;
  final List<ListenerPair<S>>? additionalListeners;
  final Failure? Function(S state)? breakingMessageSelector;
  final Widget? Function(BuildContext context, String? message)?
      breakingMessageBuilder;
  final VM Function(Store<S> store) dataConverter;
  final Widget Function(BuildContext context, VM vm) dataBuilder;

  const ResourceConnector({
    Key? key,
    this.onInit,
    this.loadingSelector,
    this.loadingBuilder,
    this.popUpFailureSelector,
    this.popUpFailureListener,
    this.additionalListeners,
    this.breakingMessageSelector,
    this.breakingMessageBuilder,
    required this.dataConverter,
    required this.dataBuilder,
  }) : super(key: key);

  @override
  State<ResourceConnector<S, VM>> createState() =>
      _ResourceConnectorState<S, VM>();
}

class _ResourceConnectorState<S, VM> extends State<ResourceConnector<S, VM>> {
  @override
  void initState() {
    super.initState();
    final store = StoreProvider.of<S>(context, listen: false);
    widget.onInit?.call(store);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.loadingSelector != null)
          StoreConnector<S, bool>(
            distinct: true,
            converter: (store) => widget.loadingSelector!(store.state),
            builder: widget._safeLoadingBuilder,
          ),
        if (widget.popUpFailureSelector != null)
          StoreListener<S, Failure?>(
            converter: (store) => widget.popUpFailureSelector!(store.state),
            listener: widget._safePopUpFailureListener,
          ),
        if (widget.additionalListeners != null &&
            widget.additionalListeners?.isNotEmpty == true)
          ...widget.additionalListeners!.map(
            (e) => StoreListener<S, dynamic>(
              converter: (store) => e.selector(store.state),
              listener: e.listener,
            ),
          ),
        WidgetConnector(
          isActive: widget.breakingMessageSelector != null,
          parentBuilder: (context, child) => StoreConnector<S, String?>(
            distinct: true,
            converter: (store) => widget.breakingMessageSelector!(store.state)
                ?.getMessage(context),
            builder: (context, vm) =>
                widget._safeBreakingMessageBuilder(context, vm) ?? child,
          ),
          child: StoreConnector<S, VM>(
            distinct: true,
            converter: widget.dataConverter,
            builder: widget.dataBuilder,
          ),
        ),
      ],
    );
  }
}

class ListenerPair<S> {
  final dynamic Function(S state) selector;
  final void Function(BuildContext context, dynamic data) listener;

  const ListenerPair({
    required this.selector,
    required this.listener,
  });
}

extension<S, VM> on ResourceConnector<S, VM> {
  Widget Function(
    BuildContext context,
    bool isLoading,
  ) get _safeLoadingBuilder => (context, isLoading) {
        if (loadingBuilder != null) {
          return loadingBuilder!(context, isLoading) ?? const SizedBox.shrink();
        } else {
          return isLoading ? const LoadingWidget() : const SizedBox.shrink();
        }
      };

  void Function(
    BuildContext context,
    Failure? failure,
  ) get _safePopUpFailureListener =>
      popUpFailureListener ??
      (context, failure) {
        if (failure != null) {
          CustomSnackBar(message: failure.getMessage(context)).show(context);
        }
      };

  Widget? Function(
    BuildContext context,
    String? message,
  ) get _safeBreakingMessageBuilder => (context, message) {
        if (breakingMessageBuilder != null) {
          return breakingMessageBuilder!(context, message);
        } else {
          return message != null
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(UI.dimens.d8),
                  child: Text(message),
                )
              : null;
        }
      };
}
