import 'package:flutter/material.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/widgets/category_selector.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appTitle)),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            children: [
              Text(AppStrings.chooseCategory),
              const CategorySelector(),

              Text(
                AppStrings.enterValue,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),

              Text(
                AppStrings.selectUnits,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
