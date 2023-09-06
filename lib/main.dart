import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app/features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      builder: FlutterSmartDialog.init(
          //default loading widget
          // loadingBuilder: (String msg) => CustomLoadingWidget(msg: msg),
          ),
    );
  }
}

class CustomLoadingWidget extends StatelessWidget {
  final String msg;

  const CustomLoadingWidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Colors.orange,
      child: Column(
        children: [
          const CircularProgressIndicator(),
          Text(msg),
        ],
      ),
    );
  }
}
