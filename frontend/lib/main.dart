import 'package:flutter/material.dart';
import 'package:frontend/pages/chat.dart';
import 'package:frontend/pages/signup.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Montserrat',
            inputDecorationTheme: InputDecorationTheme(
              filled: false,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 5, color: Color(0xffFFFFFF))),
              hintStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
            )),
        debugShowCheckedModeBanner: false,
        
        home: const Chat());
  }
}
