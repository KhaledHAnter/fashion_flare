import 'package:fashion_flare/Views/welcome_view.dart';
import 'package:fashion_flare/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FashionFalre());
}

class FashionFalre extends StatelessWidget {
  const FashionFalre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Flare',
      theme: ThemeData(
        
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: kFontFamily,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        WelcomeView.id: (context) => const WelcomeView(),
      },
      initialRoute: WelcomeView.id,
    );
  }
}
