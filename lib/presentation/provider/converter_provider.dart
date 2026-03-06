import 'package:flutter/material.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/data/model/unit_category_model.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class ConverterProvider extends ChangeNotifier {
  final List<UnitCategory> _categories = UnitCategoryModel.allCategories;
  int _selectedCategoryIndex = 0;
  String _inputText = "";
  String _fromUnit = "";
  String _toUnit = "";

  List<UnitCategory> get categories => _categories;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  String get inputText => _inputText;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;

  List<String> get _currentUnits => categories[_selectedCategoryIndex].units;
  List<String> get currentUnits => _currentUnits;

  ConverterProvider() {
    _fromUnit = _currentUnits[0];
    _toUnit = _currentUnits[1];
  }

  String get result {
    final double? inputValue = double.tryParse(_inputText);

    if (inputValue == null) return AppStrings.resultHint;

    final double converted = UnitCategoryModel.convert(
      value: inputValue,
      fromUnit: fromUnit,
      toUnit: toUnit,
      categoryName: _categories[_selectedCategoryIndex].name,
    );

    return _fromat(converted);
  }

  //selectcat

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    _fromUnit = _currentUnits[0];
    _toUnit = _currentUnits[1];
    _inputText = '';
    notifyListeners();
  }
  //updateinput

  void updateInput(String value) {
    _inputText = value;
    notifyListeners();
  }

  //updatefromunit
  void updateFromUnit(String unit) {
    _fromUnit = unit;
    notifyListeners();
  }

  //tounit
  void updateToUnit(String unit) {
    _toUnit = unit;
    notifyListeners();
  }

  //swap
  void swap() {
    final temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;
    notifyListeners();
  }

  String _fromat(double value) {
    String str = value.toStringAsFixed(6);
    str = str.replaceAll(RegExp(r'0+$'), ''); // remove trailing zeros
    str = str.replaceAll(RegExp(r'\.$'), ''); // remove trailing dot
    return str;
  }
}
