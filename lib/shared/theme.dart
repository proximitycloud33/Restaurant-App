import 'package:flutter/material.dart';

/// Class static tema untuk warna dan font. supaya tidak terlalu panjang saat mengganti style
class MyTheme {
  static ColorScheme colorsScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  static TextStyle? headlineLarge(Color color, BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge?.copyWith(color: color);
  static TextStyle? headlineMedium(Color color, BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium?.copyWith(color: color);
  static TextStyle? headlineSmall(Color color, BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall?.copyWith(color: color);

  static TextStyle? titleLarge(Color color, BuildContext context) =>
      Theme.of(context).textTheme.titleLarge?.copyWith(color: color);
  static TextStyle? titleMedium(Color color, BuildContext context) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(color: color);
  static TextStyle? titleSmall(Color color, BuildContext context) =>
      Theme.of(context).textTheme.titleSmall?.copyWith(color: color);

  static TextStyle? bodyLarge(Color color, BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(color: color);
  static TextStyle? bodyMedium(Color color, BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(color: color);
  static TextStyle? bodySmall(Color color, BuildContext context) =>
      Theme.of(context).textTheme.bodySmall?.copyWith(color: color);

  static TextStyle? labelLarge(Color color, BuildContext context) =>
      Theme.of(context).textTheme.labelLarge?.copyWith(color: color);
  static TextStyle? labelMedium(Color color, BuildContext context) =>
      Theme.of(context).textTheme.labelMedium?.copyWith(color: color);
  static TextStyle? labelSmall(Color color, BuildContext context) =>
      Theme.of(context).textTheme.labelSmall?.copyWith(color: color);
}
