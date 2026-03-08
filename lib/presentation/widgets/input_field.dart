import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<ConverterProvider>().inputText,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final providerInput = context.read<ConverterProvider>().inputText;
    if (providerInput.isEmpty && _controller.text.isNotEmpty) {
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white, // ✅ Input text white
      ),

      cursorColor: Colors.white, // ✅ Cursor white
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        iconColor: Colors.white,
        labelText: AppStrings.inputLabel,
        labelStyle: TextStyle(color: Colors.white),
        hintText: AppStrings.inputHint,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.edit_note, color: Colors.white),
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
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.white),
                onPressed: () {
                  _controller.clear();
                  context.read<ConverterProvider>().updateInput('');
                  setState(() {});
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {});
        context.read<ConverterProvider>().updateInput(value);
      },
    );
  }
}
