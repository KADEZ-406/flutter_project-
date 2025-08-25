import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/common/custom_app_bar.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/action_bar.dart';
import '../widgets/home/hero_banner.dart';
import '../widgets/home/category_grid.dart';

import 'detail_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'TechStore',
        showMenu: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Banner
                  HeroBanner(
                    imageUrl: 'https://img.freepik.com/premium-photo/background-texture-abstract-wallpaper_492154-36971.jpg',
                    title: 'Latest Tech Products',
                    subtitle: 'Discover amazing gadgets and devices',
                    onTap: () => _showHeroBannerDetails(context),
                  ),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Quick Action Buttons
                  QuickActionButtons(
                    actions: [
                      QuickAction(
                        text: 'Shop Now',
                        onPressed: () => _handleShopNow(context),
                        buttonType: ButtonType.primary,
                        icon: Icons.shopping_cart,
                      ),
                      QuickAction(
                        text: 'View Deals',
                        onPressed: () => _handleViewDeals(context),
                        buttonType: ButtonType.secondary,
                        icon: Icons.local_offer,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Category Grid
                  CategoryGrid(
                    categories: AppData.categories,
                    onCategoryTap: (category) => _handleCategoryTap(context, category),
                  ),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Featured Section
                  _buildFeaturedSection(context),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Action Bar for Featured Products
                  ActionBar(
                    title: 'Featured Products',
                    actions: [
                      ActionButton(
                        text: 'View All',
                        onPressed: () => _handleViewAllProducts(context),
                        buttonType: ButtonType.ghost,
                        icon: Icons.arrow_forward,
                      ),
                      ActionButton.spacer(),
                      ActionButton(
                        text: 'Filter',
                        onPressed: () => _handleFilterProducts(context),
                        buttonType: ButtonType.secondary,
                        icon: Icons.filter_list,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Newsletter Signup
                  _buildNewsletterSignup(context),
                ],
              ),
            ),
          ),
          

        ],
      ),
      floatingActionButton: CustomFAB(
        icon: Icons.support_agent,
        onPressed: () => _handleCustomerSupport(context),
        tooltip: 'Customer Support',
        backgroundColor: AppColors.success,
      ),
    );
  }

  Widget _buildFeaturedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Featured Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            CustomButton(
              text: 'See All',
              onPressed: () => _handleViewAllProducts(context),
              type: ButtonType.ghost,
              height: 32,
            ),
          ],
        ),
        const SizedBox(height: AppConstants.smallSpacing),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppData.products.length,
            itemBuilder: (context, index) {
              final product = AppData.products[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: AppConstants.smallSpacing),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
                  border: Border.all(color: AppColors.border),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    product['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  onTap: () => _navigateToProductDetail(context, product),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsletterSignup(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.primary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.email,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                'Stay Updated',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Get the latest tech news and exclusive offers',
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.smallBorderRadius),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              CustomButton(
                text: 'Subscribe',
                onPressed: () => _handleNewsletterSignup(context),
                type: ButtonType.primary,
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showHeroBannerDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Featured Promotion'),
        content: const Text('This is a special promotion for our latest tech products. Stay tuned for more exciting offers!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          CustomButton(
            text: 'Learn More',
            onPressed: () {
              Navigator.pop(context);
              _handleLearnMore(context);
            },
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }

  void _handleShopNow(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailScreen()),
    );
  }

  void _handleViewDeals(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🎉 Special deals are coming soon!'),
        backgroundColor: AppColors.warning,
      ),
    );
  }

  void _handleCategoryTap(BuildContext context, Map<String, dynamic> category) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${category['label']} tapped!'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'View',
          onPressed: () => _navigateToCategory(context, category),
        ),
      ),
    );
  }

  void _handleViewAllProducts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailScreen()),
    );
  }

  void _handleFilterProducts(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Products'),
        content: const Text('Filter options will be available soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleNewsletterSignup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Thank you for subscribing!'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _handleCustomerSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Customer Support'),
        content: const Text('Our support team is available 24/7. How can we help you?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          CustomButton(
            text: 'Contact Us',
            onPressed: () {
              Navigator.pop(context);
              _handleContactUs(context);
            },
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }

  void _handleLearnMore(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📚 More information will be available soon!'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _navigateToCategory(BuildContext context, Map<String, dynamic> category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
      ),
    );
  }

  void _handleContactUs(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📞 Contact form will be available soon!'),
        backgroundColor: AppColors.info,
      ),
    );
  }



  void _navigateToProductDetail(BuildContext context, Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(product: product),
      ),
    );
  }

}
