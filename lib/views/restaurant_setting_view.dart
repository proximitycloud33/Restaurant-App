import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/shared/theme.dart';

class RestaurantSettingView extends StatelessWidget {
  const RestaurantSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, preferences, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 100),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dark Mode',
                              style: MyTheme.titleMedium(
                                MyTheme.colorsScheme(context).onSurface,
                                context,
                              ),
                            ),
                            Text(
                              'Make your eyes comfortable at night',
                              style: MyTheme.bodyMedium(
                                MyTheme.colorsScheme(context).onSurfaceVariant,
                                context,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch.adaptive(
                        value: preferences.isDarkTheme,
                        onChanged: (value) {
                          preferences.enableDarkTheme(value);
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 100),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Restaurant recommendation',
                              style: MyTheme.titleMedium(
                                MyTheme.colorsScheme(context).onSurface,
                                context,
                              ),
                            ),
                            Text(
                              'Show notification for recommended restaurant ',
                              overflow: TextOverflow.ellipsis,
                              style: MyTheme.bodyMedium(
                                MyTheme.colorsScheme(context).onSurfaceVariant,
                                context,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch.adaptive(
                        value: false,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
