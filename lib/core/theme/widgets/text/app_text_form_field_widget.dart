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
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.hasBorder = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.suffixText = '',
    this.prefixText = '',
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
  final int? maxLines;
  final int? minLines;
  final bool? expands;

  final bool? hasBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? suffixText;
  final String? prefixText;
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
      maxLines: widget.maxLines,
      expands: widget.expands!,

      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabelBehavior,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: kAppGray,
            ),
        fillColor: focusNode.hasFocus ? AppColors.trGreen : AppColors.greySC50,
        focusColor: AppColors.trGreen,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: kRegularBorderRadius,
        ),
        filled: true,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: focusNode.hasFocus ? AppColors.greySC900 : AppColors.greySC50,
        enabledBorder: OutlineInputBorder(
          borderRadius: kRegularBorderRadius,
          borderSide: widget.hasBorder! ? const BorderSide(color: kTextColor) : BorderSide.none,
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greySC500,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: kRegularBorderRadius,
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: kRegularBorderRadius,
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        suffixText: widget.suffixText,
        prefixText: widget.prefixText,
        prefixStyle: const TextStyle(
          fontSize: 20,
          fontFamilyFallback: ['Arial'],
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
