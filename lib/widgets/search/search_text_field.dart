import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  SearchTextField(
    this.controller, {
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        hintText: hint ?? 'Search here...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
