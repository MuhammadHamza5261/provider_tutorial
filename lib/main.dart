import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:flutter_provider/provider/theme_changer_provider.dart';
import 'package:flutter_provider/screens/count_screen.dart';
import 'package:flutter_provider/screens/favourite/favourite_screen.dart';
import 'package:flutter_provider/screens/slider_screen.dart';
import 'package:flutter_provider/screens/theme/dark_theme.dart';
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
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),

      ],
        
         child:  Builder(
             builder: (BuildContext context){
               final themeChanger = Provider.of<ThemeChangerProvider>(context);
               return MaterialApp(
                 debugShowCheckedModeBanner: false,
                 themeMode: themeChanger.themeMode,
                 // for use primary
                 theme: ThemeData(
                   brightness: Brightness.light ,
                     primarySwatch: Colors.blue,
                 ),
                 darkTheme: ThemeData(
                   brightness: Brightness.dark,
                   primarySwatch: Colors.purple
                 ),
                 home: DarkTheme(),
               );
             }
         )
    );
  }
}


