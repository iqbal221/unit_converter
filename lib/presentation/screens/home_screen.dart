import 'package:flutter/material.dart';
import 'package:quick_convert/core/app_colors.dart';
import 'package:quick_convert/core/app_strings.dart';
import 'package:quick_convert/presentation/widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.homeTitle,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          CategorySelector(),
        ],
      ),
    );
  }
}
