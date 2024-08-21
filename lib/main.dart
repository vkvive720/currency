import "package:currency/pages/home_page.dart";
import "package:currency/themes/dark_theme.dart";
import "package:currency/themes/light_theme.dart";
import "package:flutter/material.dart";

void main()
{
  runApp(My_App());
}

class My_App extends StatelessWidget {
  const My_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:home_Page(),
      ),

    );
  }
}
