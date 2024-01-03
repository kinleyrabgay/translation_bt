import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Dzongkha NLP'.text.make()),
      body: const Text('Hello'),
    );
  }
}
