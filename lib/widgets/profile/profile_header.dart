import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String profileName;
  final String? profileImage;
  final VoidCallback? onTap;

  const ProfileHeader({
    super.key,
    required this.profileName,
    this.profileImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Profile Picture with Red Highlight
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.error, // Red highlight as shown in wireframe
              borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
            ),
            child: Center(
              child: Text(
                'PICS',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.defaultPadding),
          // Profile Name
          Expanded(
            child: Text(
              profileName,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
