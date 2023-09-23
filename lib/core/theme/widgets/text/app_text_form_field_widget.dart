import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorioo/core/theme/colors.dart';
import 'package:sorioo/core/theme/constants.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.enabled,
    required this.autofocus,
    required this.textInputAction,
    required this.textInputType,
    required this.hintText,
    super.key,
    this.controller,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.prefixIcon,
    this.focusNode,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.inputFormatters = const [],
    this.maxLines = 0,
  });

  final TextEditingController? controller;
  final bool enabled;
  final bool autofocus;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;

  final Icon? prefixIcon;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? readOnly;
  final int maxLines;
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: focusNode,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      autovalidateMode: widget.autovalidateMode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        fillColor: focusNode.hasFocus ? AppColors.trGreen : AppColors.greySC50,
        focusColor: AppColors.trGreen,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: kRegularBorderRadius,
        ),
        filled: true,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: focusNode.hasFocus ? AppColors.greySC900 : AppColors.greySC50,
        enabledBorder: const OutlineInputBorder(
          borderRadius: kRegularBorderRadius,
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: kRegularBorderRadius,
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: kRegularBorderRadius,
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      validator: widget.validator,
      obscureText: widget.obscureText!,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly!,
      inputFormatters: widget.inputFormatters,
      // maxLines: widget.maxLines,
    );
  }
}
