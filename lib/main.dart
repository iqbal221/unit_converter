import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_convert/core/app_colors.dart';
import 'package:quick_convert/core/app_strings.dart';
import 'package:quick_convert/presentation/provider/converter_provider.dart';
import 'package:quick_convert/presentation/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ConverterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: AppColors.seedColor,
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
