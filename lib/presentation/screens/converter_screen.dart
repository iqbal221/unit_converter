import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_colors.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';
import 'package:unit_converter/presentation/widgets/category_selector.dart';
import 'package:unit_converter/presentation/widgets/input_field.dart';
import 'package:unit_converter/presentation/widgets/result_card.dart';
import 'package:unit_converter/presentation/widgets/unit_drop_down.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  static const String routeName = '/converter';

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    final category = provider.categories[provider.selectedCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name, style: TextStyle(fontSize: 27)),
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 30,
            children: [
              SizedBox(height: 10),
              Text(
                AppStrings.enterValue,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const InputField(),
              Text(
                AppStrings.selectUnits,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: UnitDropdown(
                      label: AppStrings.fromLabel,
                      selectedUnit: provider.fromUnit,

                      units: provider.currentUnits,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateFromUnit(
                          value!,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton.filledTonal(
                      tooltip: AppStrings.swapTooltip,
                      icon: const Icon(Icons.swap_horiz),
                      onPressed: () => context.read<ConverterProvider>().swap(),
                    ),
                  ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: UnitDropdown(
                      label: AppStrings.toLabel,
                      selectedUnit: provider.toUnit,
                      units: provider.currentUnits,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateToUnit(value!);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ResultCard(),
            ],
          ),
        ),
      ),
    );
  }
}
