import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    this.hintText,
    this.textController,
    this.validator,
    this.maxLines,
    this.minLines,
    required this.labelText,
    this.inputFormatters,
    this.keyboardType,
  });

  final String? hintText;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final String labelText;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: textController,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          validator: validator,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
