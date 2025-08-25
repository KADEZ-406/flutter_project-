import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';

class TextDetailItem extends StatelessWidget {
  final String label;
  final double height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;

  const TextDetailItem({
    super.key,
    this.label = 'TEXT DETAIL',
    this.height = 60.0,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: const EdgeInsets.only(bottom: AppConstants.smallSpacing),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.placeholder,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.borderRadius,
        ),
        border: Border.all(
          color: borderColor ?? AppColors.border,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class TextDetailList extends StatelessWidget {
  final List<String> labels;
  final double itemHeight;
  final double spacing;

  const TextDetailList({
    super.key,
    required this.labels,
    this.itemHeight = 60.0,
    this.spacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: labels.map((label) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: TextDetailItem(
          label: label,
          height: itemHeight,
        ),
      )).toList(),
    );
  }
}
