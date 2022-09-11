import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/services/api_service.dart';
import 'package:restaurant_app/views/restaurant_grid_view.dart';

class RestaurantSearchScreen extends StatefulWidget {
  const RestaurantSearchScreen({super.key});
  static const String routeName = '/searchScreen';
  @override
  State<RestaurantSearchScreen> createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (context) => RestaurantProvider(
        ApiService(),
      ),
      child: Builder(builder: (context) {
        final restaurantProvider =
            Provider.of<RestaurantProvider>(context, listen: false);
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: TextField(
                controller: _searchController,
                autofocus: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    tooltip: 'Cancel',
                    onPressed: () {
                      // refresh state pada saat click icon cancel, kembali ke container kosong
                      setState(() {
                        _searchController.clear();
                      });
                    },
                  ),
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                onChanged: (String value) {
                  if (value.isNotEmpty) {
                    restaurantProvider.fetchSearchRestaurantSearchData(value);
                  }
                },
              ),
            ),
            body: Builder(
              builder: (context) {
                final bool error = Provider.of<RestaurantProvider>(context)
                        .restaurantSearch
                        ?.error ??
                    true;
                final int founded = Provider.of<RestaurantProvider>(context)
                        .restaurantSearch
                        ?.founded ??
                    0;
                if (_searchController.text.isEmpty) {
                  return Container();
                } else if (founded > 0 && error == false) {
                  return const RestaurantGridView(searchMode: true);
                } else if (founded <= 0) {
                  return const Center(
                    child: Text('Pencarian tidak ditemukan'),
                  );
                } else {
                  return const Center(
                    child: Text('No Internet Connection'),
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
