import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/app_colors.dart';
import '../constants/app_data.dart';
import '../widgets/common/custom_app_bar.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/detail/product_card.dart';
import '../widgets/home/bottom_icons.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic>? product;

  const DetailScreen({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(
        title: 'Product Details',
        showMenu: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Cards
                  if (product != null)
                    ProductCard(
                      product: product!,
                      onTap: () => _showProductDetails(context, product!),
                    )
                  else
                    ...AppData.products.map((p) => ProductCard(
                      product: p,
                      onTap: () => _showProductDetails(context, p),
                    )).toList(),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Additional Info Section
                  _buildAdditionalInfoSection(),
                  
                  const SizedBox(height: AppConstants.defaultSpacing),
                  
                  // Product Actions
                  _buildProductActions(context),
                ],
              ),
            ),
          ),
          
          // Bottom Icons Row
          BottomIcons(
            items: AppData.bottomNavItems.map((item) => BottomIconItem(
              icon: item['icon'],
              label: item['label'],
              onTap: () => _handleBottomNavTap(context, item),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppConstants.smallSpacing),
        Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              _buildInfoRow('Brand', 'TechStore'),
              _buildInfoRow('Warranty', '1 Year'),
              _buildInfoRow('Shipping', 'Free Shipping'),
              _buildInfoRow('Return Policy', '30 Days'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  void _showProductDetails(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(product['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: ${product['price']}'),
            const SizedBox(height: 8),
            Text('Rating: ${product['rating']} ⭐'),
            const SizedBox(height: 8),
            Text('Reviews: ${product['reviews']}'),
            const SizedBox(height: 8),
            Text('Description: ${product['description']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${product['name']} added to cart!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }

  void _handleBottomNavTap(BuildContext context, Map<String, dynamic> item) {
    switch (item['label']) {
      case 'Home':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 'Explore':
        // Already on explore/detail screen
        break;
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  Widget _buildProductActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Actions',
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
                text: 'Add to Cart',
                onPressed: () => _handleAddToCart(context),
                type: ButtonType.primary,
                icon: Icons.shopping_cart,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Buy Now',
                onPressed: () => _handleBuyNow(context),
                type: ButtonType.success,
                icon: Icons.payment,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Add to Wishlist',
                onPressed: () => _handleAddToWishlist(context),
                type: ButtonType.secondary,
                icon: Icons.favorite_border,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Share Product',
                onPressed: () => _handleShareProduct(context),
                type: ButtonType.ghost,
                icon: Icons.share,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Compare',
                onPressed: () => _handleCompareProduct(context),
                type: ButtonType.secondary,
                icon: Icons.compare_arrows,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Write Review',
                onPressed: () => _handleWriteReview(context),
                type: ButtonType.ghost,
                icon: Icons.rate_review,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleAddToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
          content: const Text('🛒 Product added to cart successfully!'),
          backgroundColor: AppColors.success,
          action: SnackBarAction(
            label: 'View Cart',
            onPressed: () => _showCart(context),
          ),
        ),
    );
  }

  void _handleBuyNow(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Buy Now'),
        content: const Text('Proceed to checkout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          CustomButton(
            text: 'Checkout',
            onPressed: () {
              Navigator.pop(context);
              _handleCheckout(context);
            },
            type: ButtonType.success,
          ),
        ],
      ),
    );
  }

  void _handleAddToWishlist(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('❤️ Product added to wishlist!'),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _handleShareProduct(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('📤 Product shared successfully!'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _handleCompareProduct(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('⚖️ Product added to comparison!'),
        backgroundColor: AppColors.warning,
      ),
    );
  }

  void _handleWriteReview(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Write Review'),
        content: const Text('Review form will be available soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🛒 Cart feature will be available soon!'),
        backgroundColor: AppColors.info,
      ),
    );
  }

  void _handleCheckout(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('💳 Checkout process will be available soon!'),
        backgroundColor: AppColors.success,
      ),
    );
  }
}
