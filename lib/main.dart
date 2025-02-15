import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/screens/count_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen_stl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterProvider(),
         child: const MaterialApp(
           home: CountScreen(),
         ),
    );
  }
}


