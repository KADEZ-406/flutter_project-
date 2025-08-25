import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/common/custom_app_bar.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/profile/profile_header_realistic.dart';
import '../widgets/profile/profile_icons.dart';
import '../widgets/profile/profile_menu_item_realistic.dart';
import 'home_screen.dart';
import 'detail_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Profile',
        showMenu: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            ProfileHeaderRealistic(
              userName: AppData.userName,
              userEmail: AppData.userEmail,
              userAvatar: AppData.userAvatar,
              onEditProfile: () => _handleEditProfile(context),
            ),
            
            const SizedBox(height: AppConstants.defaultSpacing),
            
            // Profile Actions
            ProfileIcons(
              items: AppData.profileActions.map((action) => ProfileIconItem(
                icon: action['icon'],
                label: action['label'],
                onTap: () => _handleProfileAction(context, action),
              )).toList(),
            ),
            
            const SizedBox(height: AppConstants.defaultSpacing),
            
            // Profile Menu
            ProfileMenuList(
              menuItems: AppData.profileMenuItems,
              onMenuItemTap: (item) => _handleMenuItemTap(context, item),
            ),
            
            const SizedBox(height: AppConstants.defaultSpacing),
            
                              // Stats Section
                  _buildStatsSection(),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Quick Actions
                  _buildQuickActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Statistics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppConstants.smallSpacing),
        Row(
          children: [
            Expanded(
              child: _buildStatCard('Orders', '12', Icons.shopping_bag, AppColors.primary),
            ),
            const SizedBox(width: AppConstants.smallSpacing),
            Expanded(
              child: _buildStatCard('Wishlist', '8', Icons.favorite, AppColors.error),
            ),
            const SizedBox(width: AppConstants.smallSpacing),
            Expanded(
              child: _buildStatCard('Reviews', '5', Icons.star, AppColors.warning),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _handleEditProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Text('Profile editing feature will be available soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleProfileAction(BuildContext context, Map<String, dynamic> action) {
    switch (action['label']) {
      case 'Edit':
        _handleEditProfile(context);
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailScreen()),
        );
        break;
      case 'Share':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${action['label']} feature tapped!'),
            backgroundColor: AppColors.info,
          ),
        );
        break;
    }
  }

  void _handleMenuItemTap(BuildContext context, Map<String, dynamic> item) {
    switch (item['title']) {
      case 'Personal Info':
        _showFeatureDialog(context, 'Personal Info', 'Personal information management will be available soon!');
        break;
      case 'Security':
        _showFeatureDialog(context, 'Security', 'Security settings will be available soon!');
        break;
      case 'Notifications':
        _showFeatureDialog(context, 'Notifications', 'Notification settings will be available soon!');
        break;
      case 'Help & Support':
        _showFeatureDialog(context, 'Help & Support', 'Help and support will be available soon!');
        break;
      case 'Logout':
        _showLogoutDialog(context);
        break;
    }
  }

  void _showFeatureDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          CustomButton(
            text: 'Logout',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Successfully logged out!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            type: ButtonType.danger,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppConstants.smallSpacing),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'My Orders',
                onPressed: () => _handleMyOrders(context),
                type: ButtonType.primary,
                icon: Icons.shopping_bag,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'My Wishlist',
                onPressed: () => _handleMyWishlist(context),
                type: ButtonType.secondary,
                icon: Icons.favorite,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Track Order',
                onPressed: () => _handleTrackOrder(context),
                type: ButtonType.success,
                icon: Icons.local_shipping,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Support',
                onPressed: () => _handleSupport(context),
                type: ButtonType.ghost,
                icon: Icons.help,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleMyOrders(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📦 Your orders will be displayed here'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _handleMyWishlist(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('❤️ Your wishlist will be displayed here'),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _handleTrackOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Track Order'),
        content: const Text('Enter your order number to track your package'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          CustomButton(
            text: 'Track',
            onPressed: () {
              Navigator.pop(context);
              _showTrackingResult(context);
            },
            type: ButtonType.success,
          ),
        ],
      ),
    );
  }

  void _handleSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Customer Support'),
        content: const Text('How can we help you today?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          CustomButton(
            text: 'Contact',
            onPressed: () {
              Navigator.pop(context);
              _handleContactSupport(context);
            },
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }

  void _showTrackingResult(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📦 Order tracking feature will be available soon!'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _handleContactSupport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📞 Support contact form will be available soon!'),
        backgroundColor: AppColors.info,
      ),
    );
  }
}
