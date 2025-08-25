import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';

class IconGrid extends StatelessWidget {
  final List<IconGridItem> items;
  final int crossAxisCount;
  final double spacing;

  const IconGrid({
    super.key,
    required this.items,
    this.crossAxisCount = 3,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}

class IconGridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  const IconGridItem({
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
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.surface,
          borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppConstants.largeIconSize,
              color: iconColor ?? AppColors.primary,
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
      ),
    );
  }
}
