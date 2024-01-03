import 'package:flutter/material.dart';
import 'package:translation_bt/src/home/presentation/widgets/generic_feature_builder.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Dzongkha NLP'.text.make()),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // F1
            GenericFeatureBuilder(),

            SizedBox(height: 16),

            // F2
            GenericFeatureBuilder(),
          ],
        ),
      ),
    );
  }
}
