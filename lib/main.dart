import 'package:flutter/material.dart';
import 'package:translation_bt/core/services/injection_container.dart';
import 'package:translation_bt/core/services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dzongkha NLP',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
