import 'package:flutter/material.dart';

class TextFieldDecoration {
  static fieldDecoration(
    Size size,
    BuildContext context,
    String? label,
    String? hint,
    Icon? preIcon,
    IconButton? sufIcon,
  ) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFFFF8E1), // Light beige background
      labelText: label,
      hintText: hint,
      prefixIcon: preIcon,
      suffixIcon: sufIcon,
      labelStyle: TextStyle(fontSize: size.height * 0.023),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Theme.of(context)
              .colorScheme
              .primary, // Color of the border when focused
          width: 2.0, // Width of the border
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Theme.of(context)
              .colorScheme
              .primary, // Color of the border when focused
          width: 2.0, // Width of the border
        ),
      ),
    );
  }
}
