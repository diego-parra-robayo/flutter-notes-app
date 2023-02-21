import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/connectors/sign_out_connector.dart';
import 'package:ui/theme/ui.dart';
import 'package:ui/widgets_app/loading_widget.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const NotesAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        SignOutConnector(
          builder: (context, vm) => vm.isLoading
              ? const LoadingAppBarWidget()
              : IconButton(
                  onPressed: vm.onSignOut,
                  icon: const Icon(Icons.logout),
                ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        UI.themes.light.appBarTheme.toolbarHeight ?? kToolbarHeight,
      );
}
