import 'package:flutter/material.dart';
import 'package:food/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14, color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF353842),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintText: 'Trova un piatto',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Color(
            0xFF686F82,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        suffixIcon: const Icon(
          Icons.search_sharp,
          color: mainColor,
          size: 35,
        ),
      ),
    );
  }
}
