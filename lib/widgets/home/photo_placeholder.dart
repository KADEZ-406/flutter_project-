import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';

class PhotoPlaceholder extends StatelessWidget {
  final double? height;
  final double? borderRadius;
  final String? label;
  final Color? backgroundColor;

  const PhotoPlaceholder({
    super.key,
    this.height,
    this.borderRadius,
    this.label = 'PHOTO',
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? AppConstants.photoHeight,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.placeholder,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.borderRadius,
        ),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo,
              size: 48,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 8),
            Text(
              label!,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
