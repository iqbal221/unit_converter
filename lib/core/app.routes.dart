import 'package:flutter/material.dart';
import 'package:unit_converter/presentation/screens/converter_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    Widget widget = SizedBox();

    if (settings.name == ConverterScreen.routeName) {
      widget = ConverterScreen();
      // } else if (settings.name == SignUpScreen.name) {
      //   widget = SignUpScreen();
      // } else if (settings.name == SignInScreen.name) {
      //   widget = SignInScreen();
      // } else if (settings.name == VerifyOTPScreen.name) {
      //   final email = settings.arguments as String;
      //   widget = VerifyOTPScreen(email: email);
      // } else if (settings.name == MainNavHolderScreen.name) {
      //   widget = MainNavHolderScreen();
      // } else if (settings.name == ProductListByCategoryScreen.name) {
      //   final categoryModel = settings.arguments as CategoryModel;
      //   widget = ProductListByCategoryScreen(categoryModel: categoryModel);
      // } else if (settings.name == ProductDetailsScreen.name) {
      //   final productId = settings.arguments as String;
      //   widget = ProductDetailsScreen(productId: productId);
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
