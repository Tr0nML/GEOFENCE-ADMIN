import 'package:flutter/material.dart';
import '../themes/text_theme.dart';

class CustomTextBox extends StatefulWidget {
  final String label; final Icon icon;
  const CustomTextBox({super.key, required this.label, required this.icon});

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        labelText: widget.label,
        labelStyle: AppTextTheme.lightTextTheme.bodyLarge,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
      ),
    );
  }
}