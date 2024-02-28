import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statements/widget/expenses.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown
  ]).then((fn){
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(87, 255, 255, 255)
            )
          ),
          cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            )
          ),
        ),
        theme: ThemeData().copyWith(
          cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            )
          ),
        ),
        home: const Expenses(),
      )
    );
  });
}