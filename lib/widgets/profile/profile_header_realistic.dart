import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_colors.dart';
import '../common/network_image_widget.dart';

class ProfileHeaderRealistic extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userAvatar;
  final VoidCallback? onEditProfile;

  const ProfileHeaderRealistic({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userAvatar,
    this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.avatarRadius),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.avatarRadius),
              child: NetworkImageWidget(
                imageUrl: userAvatar,
                width: AppConstants.avatarRadius * 2,
                height: AppConstants.avatarRadius * 2,
                borderRadius: 0,
                placeholder: Container(
                  width: AppConstants.avatarRadius * 2,
                  height: AppConstants.avatarRadius * 2,
                  color: AppColors.placeholder,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(width: AppConstants.defaultPadding),
          
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userEmail,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.success.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified,
                            size: 12,
                            color: AppColors.success,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Verified',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Edit Button
          IconButton(
            onPressed: onEditProfile,
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
              ),
              child: const Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
