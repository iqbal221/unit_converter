import 'package:flutter/material.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class UnitCategoryModel extends UnitCategory {
  UnitCategoryModel({
    required super.name,
    required super.iconData,
    required super.units,
  });

  static List<UnitCategoryModel> allCategories = [
    UnitCategoryModel(
      name: 'Length',
      iconData: Icons.straighten,
      units: ['Meter', 'Kilometer', 'Mile', 'Foot', 'Inch', 'Centimeter'],
    ),

    UnitCategoryModel(
      name: 'Weight',
      iconData: Icons.fitness_center,
      units: ['Kilogram', 'Gram', 'Pound', 'Ounce'],
    ),
    UnitCategoryModel(
      name: 'Temperature',
      iconData: Icons.thermostat,
      units: ['Celsius', 'Fahrenheit', 'Kelvin'],
    ),
    UnitCategoryModel(
      name: 'Time',
      iconData: Icons.watch,
      units: ['Second', 'Minute', 'Hour', 'Day'],
    ),
    UnitCategoryModel(
      name: 'Power',
      iconData: Icons.light,
      units: ['Watt', 'Kilowatt', 'Horsepower'],
    ),
    UnitCategoryModel(
      name: 'Volume',
      iconData: Icons.volume_down,
      units: ['Liter', 'Milliliter', 'Cubic Meter', 'Gallon'],
    ),
    UnitCategoryModel(
      name: 'Speed',
      iconData: Icons.directions_car,
      units: ['m/s', 'km/h', 'mph'],
    ),
    UnitCategoryModel(
      name: 'Pressure',
      iconData: Icons.bubble_chart,
      units: ['Pascal', 'Bar', 'PSI', 'Atmosphere'],
    ),
    UnitCategoryModel(
      name: 'Area',
      iconData: Icons.crop_square,
      units: ['Square Meter', 'Square Kilometer', 'Square Mile', 'Square Foot'],
    ),
  ];

  static double convert({
    required double value,
    required String fromUnit,
    required String toUnit,
    required String categoryName,
  }) {
    if (fromUnit == toUnit) return value;

    switch (categoryName) {
      case 'Length':
        return _convertLength(value, fromUnit, toUnit);
      case 'Weight':
        return _convertWeight(value, fromUnit, toUnit);
      case 'Temperature':
        return _convertTemperature(value, fromUnit, toUnit);
      case 'Time':
        return _convertTime(value, fromUnit, toUnit);
      case 'Power':
        return _convertPower(value, fromUnit, toUnit);
      case 'Volume':
        return _convertVolume(value, fromUnit, toUnit);
      case 'Speed':
        return _convertSpeed(value, fromUnit, toUnit);
      case 'Pressure':
        return _convertPressure(value, fromUnit, toUnit);
      case 'Area':
        return _convertArea(value, fromUnit, toUnit);
      default:
        return value;
    }
  }

  // length
  static double _convertLength(double value, String from, String to) {
    final double inMeters = _toMeters(value, from);
    return _fromMeters(inMeters, to);
  }

  static double _toMeters(double value, String unit) {
    switch (unit) {
      case 'Meter':
        return value;
      case 'Kilometer':
        return value * 1000;
      case 'Mile':
        return value * 1609.344;
      case 'Foot':
        return value * 0.3048;
      case 'Inch':
        return value * 0.0254;
      case 'Centimeter':
        return value * 0.01;
      default:
        return value;
    }
  }

  static double _fromMeters(double meters, String unit) {
    switch (unit) {
      case 'Meter':
        return meters;
      case 'Kilometer':
        return meters / 1000;
      case 'Mile':
        return meters / 1609.344;
      case 'Foot':
        return meters / 0.3048;
      case 'Inch':
        return meters / 0.0254;
      case 'Centimeter':
        return meters / 0.01;
      default:
        return meters;
    }
  }

  // temperature
  static double _convertTemperature(double value, String from, String to) {
    double celsius;

    if (from == 'Celsius') {
      celsius = value;
    } else if (from == 'Fahrenheit') {
      celsius = (value - 32) * 5 / 9;
    } else {
      celsius = value - 273.15;
    }

    if (to == 'Celsius') {
      return celsius;
    } else if (to == 'Fahrenheit') {
      return celsius * 9 / 5 + 32;
    } else {
      return celsius + 273.15;
    }
  }

  // weight
  static double _convertWeight(double value, String from, String to) {
    final double inKg = _toKilograms(value, from);
    return _fromKilograms(inKg, to);
  }

  static double _toKilograms(double value, String unit) {
    switch (unit) {
      case 'Kilogram':
        return value;
      case 'Gram':
        return value / 1000;
      case 'Pound':
        return value * 0.453592;
      case 'Ounce':
        return value * 0.0283495;
      default:
        return value;
    }
  }

  static double _fromKilograms(double kg, String unit) {
    switch (unit) {
      case 'Kilogram':
        return kg;
      case 'Gram':
        return kg * 1000;
      case 'Pound':
        return kg / 0.453592;
      case 'Ounce':
        return kg / 0.0283495;
      default:
        return kg;
    }
  }

  // time
  static double _convertTime(double value, String from, String to) {
    final double inSeconds = _toSeconds(value, from);
    return _fromSeconds(inSeconds, to);
  }

  static double _toSeconds(double value, String unit) {
    switch (unit) {
      case 'Second':
        return value;
      case 'Minute':
        return value * 60;
      case 'Hour':
        return value * 3600;
      case 'Day':
        return value * 86400;
      default:
        return value;
    }
  }

  static double _fromSeconds(double seconds, String unit) {
    switch (unit) {
      case 'Second':
        return seconds;
      case 'Minute':
        return seconds / 60;
      case 'Hour':
        return seconds / 3600;
      case 'Day':
        return seconds / 86400;
      default:
        return seconds;
    }
  }

  // volumn
  static double _convertVolume(double value, String from, String to) {
    final double inLiters = _toLiters(value, from);
    return _fromLiters(inLiters, to);
  }

  static double _toLiters(double value, String unit) {
    switch (unit) {
      case 'Liter':
        return value;
      case 'Milliliter':
        return value * 0.001;
      case 'Cubic Meter':
        return value * 1000;
      case 'Gallon':
        return value * 3.78541;
      default:
        return value;
    }
  }

  static double _fromLiters(double liters, String unit) {
    switch (unit) {
      case 'Liter':
        return liters;
      case 'Milliliter':
        return liters / 0.001;
      case 'Cubic Meter':
        return liters / 1000;
      case 'Gallon':
        return liters / 3.78541;
      default:
        return liters;
    }
  }

  // area
  static double _convertArea(double value, String from, String to) {
    final double inSquareMeters = _toSquareMeters(value, from);
    return _fromSquareMeters(inSquareMeters, to);
  }

  static double _toSquareMeters(double value, String unit) {
    switch (unit) {
      case 'Square Meter':
        return value;
      case 'Square Kilometer':
        return value * 1000000;
      case 'Square Mile':
        return value * 2589988.11;
      case 'Square Foot':
        return value * 0.092903;
      default:
        return value;
    }
  }

  static double _fromSquareMeters(double value, String unit) {
    switch (unit) {
      case 'Square Meter':
        return value;
      case 'Square Kilometer':
        return value / 1000000;
      case 'Square Mile':
        return value / 2589988.11;
      case 'Square Foot':
        return value / 0.092903;
      default:
        return value;
    }
  }

  // power
  static double _convertPower(double value, String from, String to) {
    final double inWatts = _toWatts(value, from);
    return _fromWatts(inWatts, to);
  }

  static double _toWatts(double value, String unit) {
    switch (unit) {
      case 'Watt':
        return value;
      case 'Kilowatt':
        return value * 1000;
      case 'Horsepower':
        return value * 745.7;
      default:
        return value;
    }
  }

  static double _fromWatts(double value, String unit) {
    switch (unit) {
      case 'Watt':
        return value;
      case 'Kilowatt':
        return value / 1000;
      case 'Horsepower':
        return value / 745.7;
      default:
        return value;
    }
  }

  // speed
  static double _convertSpeed(double value, String from, String to) {
    final double inMps = _toMps(value, from);
    return _fromMps(inMps, to);
  }

  static double _toMps(double value, String unit) {
    switch (unit) {
      case 'm/s':
        return value;
      case 'km/h':
        return value * 0.277778;
      case 'mph':
        return value * 0.44704;
      default:
        return value;
    }
  }

  static double _fromMps(double value, String unit) {
    switch (unit) {
      case 'm/s':
        return value;
      case 'km/h':
        return value / 0.277778;
      case 'mph':
        return value / 0.44704;
      default:
        return value;
    }
  }

  // pressure
  static double _convertPressure(double value, String from, String to) {
    final double inPascal = _toPascal(value, from);
    return _fromPascal(inPascal, to);
  }

  static double _toPascal(double value, String unit) {
    switch (unit) {
      case 'Pascal':
        return value;
      case 'Bar':
        return value * 100000;
      case 'PSI':
        return value * 6894.76;
      case 'Atmosphere':
        return value * 101325;
      default:
        return value;
    }
  }

  static double _fromPascal(double value, String unit) {
    switch (unit) {
      case 'Pascal':
        return value;
      case 'Bar':
        return value / 100000;
      case 'PSI':
        return value / 6894.76;
      case 'Atmosphere':
        return value / 101325;
      default:
        return value;
    }
  }
}
