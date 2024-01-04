import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.zero,
      children: const <Widget>[Text('Hello')],
    );
  }
}
