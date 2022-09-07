import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restraurant_model.dart';
import 'package:restaurant_app/views/menu_selection_view.dart';

class MenuSelectionScreen extends StatelessWidget {
  static const String routeName = '/menuSelectionScreen';
  final Restaurant restaurant;
  const MenuSelectionScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${restaurant.name} Menu'),
      ),
      body: MenuSelection(restaurant: restaurant),
    );
  }
}
