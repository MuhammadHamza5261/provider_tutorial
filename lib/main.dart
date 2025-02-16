import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:flutter_provider/screens/count_screen.dart';
import 'package:flutter_provider/screens/favourite/favourite_screen.dart';
import 'package:flutter_provider/screens/slider_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),

      ],
        
         child: const MaterialApp(
           debugShowCheckedModeBanner: false,
           home: FavouriteScreen(),
         ),
    );
  }
}


