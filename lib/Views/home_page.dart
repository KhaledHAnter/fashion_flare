import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fashion Flare'),
      ),
      body: Center(
        child:
            LoadingAnimationWidget.inkDrop(color: Colors.redAccent, size: 100),
      ),
    );
  }
}
