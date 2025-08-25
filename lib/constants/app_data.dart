import 'package:flutter/material.dart';

class AppData {
  // Mock user data
  static const String userName = 'John Doe';
  static const String userEmail = 'john.doe@email.com';
  static const String userAvatar = 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face';
  
  // Mock categories for home screen
  static const List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'color': Colors.blue,
    },
    {
      'icon': Icons.search,
      'label': 'Search',
      'color': Colors.green,
    },
    {
      'icon': Icons.favorite,
      'label': 'Favorites',
      'color': Colors.red,
    },
    {
      'icon': Icons.shopping_cart,
      'label': 'Cart',
      'color': Colors.orange,
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
      'color': Colors.purple,
    },
    {
      'icon': Icons.notifications,
      'label': 'Notifications',
      'color': Colors.teal,
    },
    {
      'icon': Icons.settings,
      'label': 'Settings',
      'color': Colors.indigo,
    },
    {
      'icon': Icons.help,
      'label': 'Help',
      'color': Colors.cyan,
    },
    {
      'icon': Icons.more_horiz,
      'label': 'More',
      'color': Colors.grey,
    },
  ];

  // Mock products for detail screen
  static const List<Map<String, dynamic>> products = [
    {
      'id': '1',
      'name': 'iPhone 15 Pro',
      'description': 'Latest iPhone with advanced camera system',
      'price': '\$999',
      'image': 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=300&fit=crop',
      'rating': 4.8,
      'reviews': 1247,
    },
    {
      'id': '2',
      'name': 'MacBook Air M2',
      'description': 'Powerful laptop with M2 chip',
      'price': '\$1199',
      'image': 'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400&h=300&fit=crop',
      'rating': 4.9,
      'reviews': 892,
    },
  ];

  // Mock profile menu items
  static const List<Map<String, dynamic>> profileMenuItems = [
    {
      'icon': Icons.person,
      'title': 'Personal Info',
      'subtitle': 'Manage your account details',
    },
    {
      'icon': Icons.security,
      'title': 'Security',
      'subtitle': 'Password and privacy settings',
    },
    {
      'icon': Icons.notifications,
      'title': 'Notifications',
      'subtitle': 'Control your notifications',
    },
    {
      'icon': Icons.help,
      'title': 'Help & Support',
      'subtitle': 'Get help and contact support',
    },
    {
      'icon': Icons.logout,
      'title': 'Logout',
      'subtitle': 'Sign out of your account',
    },
  ];

  // Mock bottom navigation items
  static const List<Map<String, dynamic>> bottomNavItems = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'color': Colors.blue,
    },
    {
      'icon': Icons.explore,
      'label': 'Explore',
      'color': Colors.green,
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
      'color': Colors.purple,
    },
  ];

  // Mock profile actions
  static const List<Map<String, dynamic>> profileActions = [
    {
      'icon': Icons.edit,
      'label': 'Edit',
      'color': Colors.blue,
    },
    {
      'icon': Icons.settings,
      'label': 'Settings',
      'color': Colors.grey,
    },
    {
      'icon': Icons.share,
      'label': 'Share',
      'color': Colors.green,
    },
  ];
}
