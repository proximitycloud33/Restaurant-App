// import 'package:flutter/material.dart';
// import 'package:restaurant_app/model/restraurant_list_model.dart';
// import 'package:restaurant_app/shared/theme.dart';

// class MenuList extends StatelessWidget {
//   final Restaurant restaurant;
//   final String menuType;
//   const MenuList({Key? key, required this.restaurant, required this.menuType})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List menuList = [];

//     if (menuType == 'foods') {
//       menuList = restaurant.menus.foods;
//     } else if (menuType == 'drinks') {
//       menuList = restaurant.menus.drinks;
//     }
//     return ListView.separated(
//       itemCount: menuList.length,
//       itemBuilder: (context, index) {
//         final name = menuList[index].name;
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: MyTheme.colorsScheme(context).primary,
//               foregroundColor: MyTheme.colorsScheme(context).onPrimary,
//               child: Text('${index + 1}'),
//             ),
//             title: Text(
//               name,
//               style: MyTheme.titleMedium(
//                 MyTheme.colorsScheme(context).onBackground,
//                 context,
//               ),
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8),
//           child: Divider(),
//         );
//       },
//     );
//   }
// }
