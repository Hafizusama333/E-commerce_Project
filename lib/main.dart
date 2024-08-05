import 'package:flutter/material.dart';
import 'package:ecommerce_app/Screens/splash_screen/splash_Screen.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/Screens/api/api_service.dart'; // Adjust import as needed

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce app',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: SplashScreen(),
    );
  }
}
