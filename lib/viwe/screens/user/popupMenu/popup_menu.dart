import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../../../Model/menu_items.dart';
import '../../../../Model/model_menu_item.dart';
import '../../../../logic/controllers/prodect_controller.dart';


class PopupMenu extends StatelessWidget {
  PopupMenu({super.key});
  final controller = Get.put(variable());
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemPoup>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
              ...MenuItems.menuItemsUser.map(buildItem).toList(),
            ]);
  }

  PopupMenuItem<MenuItemPoup> buildItem(MenuItemPoup item) => PopupMenuItem(
      value: item,
      child: Container(
        width: double.infinity,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            Text(" "),
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(color: item.color),
              ),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemPoup item) {
    switch (item) {
      case MenuItems.addToCart:
        break;

      case MenuItems.itemDelete:
        break;
    }
  }
}
