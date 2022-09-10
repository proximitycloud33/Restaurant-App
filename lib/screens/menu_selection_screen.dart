import 'package:flutter/material.dart';
import 'package:restaurant_app/views/menu_selection_view.dart';

class MenuSelectionScreen extends StatelessWidget {
  static const String routeName = '/menuSelectionScreen';
  final String restaurantId;

  const MenuSelectionScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: MenuSelectionView(restaurantId: restaurantId),
    );
  }
}
