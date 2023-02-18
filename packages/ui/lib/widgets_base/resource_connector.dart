import 'package:flutter/material.dart';
import 'package:redux_core/redux_core.dart';
import 'package:ui/alerts/custom_snackbar.dart';
import 'package:ui/widgets_app/loading_widget.dart';
import 'package:ui/widgets_base/widget_connector.dart';

import '../theme/ui.dart';

class ResourceConnector<S, VM> extends StatelessWidget {
  final void Function(Store<S> store)? onInit;
  final bool Function(S state)? loadingSelector;
  final Widget? Function(BuildContext context, bool isLoading)? loadingBuilder;
  final String? Function(S state)? popUpMessageSelector;
  final void Function(BuildContext context, String? message)?
      popUpMessageListener;
  final List<ListenerPair<S>>? additionalListeners;
  final String? Function(S state)? breakingMessageSelector;
  final Widget? Function(BuildContext context, String? message)?
      breakingMessageBuilder;
  final VM Function(Store<S> store) dataConverter;
  final Widget Function(BuildContext context, VM vm) dataBuilder;

  const ResourceConnector({
    Key? key,
    this.onInit,
    this.loadingSelector,
    this.loadingBuilder,
    this.popUpMessageSelector,
    this.popUpMessageListener,
    this.additionalListeners,
    this.breakingMessageSelector,
    this.breakingMessageBuilder,
    required this.dataConverter,
    required this.dataBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (loadingSelector != null)
          StoreConnector<S, bool>(
            distinct: true,
            converter: (store) => loadingSelector!(store.state),
            builder: _safeLoadingBuilder,
          ),
        if (popUpMessageSelector != null)
          StoreListener<S, String?>(
            converter: (store) => popUpMessageSelector!(store.state),
            listener: _safePopUpMessageListener,
          ),
        if (additionalListeners != null &&
            additionalListeners?.isNotEmpty == true)
          ...additionalListeners!.map(
            (e) => StoreListener<S, Object>(
              converter: (store) => e.selector(store.state),
              listener: e.listener,
            ),
          ),
        WidgetConnector(
          isActive: breakingMessageSelector != null,
          parentBuilder: (context, child) => StoreConnector<S, String?>(
            distinct: true,
            converter: (store) => breakingMessageSelector!(store.state),
            builder: (context, vm) =>
                _safeBreakingMessageBuilder(context, vm) ?? child,
          ),
          child: StoreConnector<S, VM>(
            onInit: onInit,
            distinct: true,
            converter: dataConverter,
            builder: dataBuilder,
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
    String? message,
  ) get _safePopUpMessageListener =>
      popUpMessageListener ??
      (context, message) {
        if (message != null) {
          CustomSnackBar(message: message).show(context);
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
