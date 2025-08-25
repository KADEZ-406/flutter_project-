import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';

class BottomIcons extends StatelessWidget {
  final List<BottomIconItem> items;
  final double spacing;

  const BottomIcons({
    super.key,
    required this.items,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallSpacing,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) => item).toList(),
      ),
    );
  }
}

class BottomIconItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  const BottomIconItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.surface,
              borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
              border: Border.all(
                color: AppColors.border,
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              size: AppConstants.iconSize,
              color: iconColor ?? AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: textColor ?? AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
