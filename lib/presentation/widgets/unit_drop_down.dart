import 'package:flutter/material.dart';
import 'package:unit_converter/core/app_colors.dart';

class UnitDropdown extends StatelessWidget {
  const UnitDropdown({
    super.key,
    required this.label,
    required this.selectedUnit,
    required this.units,
    required this.onChanged,
  });

  final String label;
  final String selectedUnit;
  final List<String> units;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.cardColor,
      initialValue: selectedUnit,
      isExpanded: true,
      style: const TextStyle(
        color: Colors.white, // ✅ Input text white
      ),
      decoration: InputDecoration(
        iconColor: Colors.white,
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white, // ✅ White border
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),

      items: units
          .map(
            (unit) => DropdownMenuItem<String>(
              value: unit,

              child: Text(
                unit,
                style: const TextStyle(
                  color: Colors.white,
                  // ✅ Dropdown list item text white
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
