import 'package:flutter/material.dart';

abstract class Alert {
  const Alert();

  void show(BuildContext context);
}

abstract class StatelessAlert extends StatelessWidget implements Alert {
  const StatelessAlert({super.key});
}

abstract class StatefulAlert extends StatefulWidget {
  const StatefulAlert({super.key});

  @override
  AlertState<StatefulAlert> createState();
}

abstract class AlertState<S extends StatefulAlert> extends State<S>
    implements Alert {}
