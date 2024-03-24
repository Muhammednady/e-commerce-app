import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomAuthField extends StatelessWidget {
  final String hint;
  final String label;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final bool obsecureText;

  IconData? suffixIcon;
  void Function()? onClick;

  CustomAuthField({
    super.key,
    required this.hint,
    required this.label,
    required this.prefixIcon,
    required this.controller,
    required this.textInputType,
    this.validate,
    required this.obsecureText,
    this.suffixIcon,
    this.onClick,
  });

//'Enter Your Email'/'Email'
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      controller: controller,
      validator: validate ?? validate,
      //validate != null ? validate : null,
      style: const TextStyle(fontSize: 15.0, color: AppColors.grey),
      keyboardType: textInputType,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              const TextStyle(color: Colors.grey).copyWith(fontSize: 13.0),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              label,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: onClick, icon: Icon(suffixIcon! , color: AppColors.primary,))
              : null,
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.grey,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50.0))),
    );
  }
}
