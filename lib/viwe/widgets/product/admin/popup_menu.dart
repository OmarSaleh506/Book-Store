import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../Model/menu_items.dart';
import '../../../../Model/model_menu_item.dart';
import '../../../../logic/controllers/prodect_controller.dart';
import '../../../screens/admin/edit_product_screen.dart';

class PopupMenu extends StatelessWidget {
  String productId;
  String productName;
  String category;
  String quantity;
  String price;
  String description;
  String imageUrl;

  PopupMenu(
      {super.key,
      required this.productId,
      required this.productName,
      required this.category,
      required this.quantity,
      required this.price,
      required this.description,
      required this.imageUrl});
  final controller = Get.find<variable>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemPoup>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onSelected: (item) {
        onSelected(context, item);
        print(productName);
      },
      itemBuilder: (context) => [
        ...MenuItems.menuItems.map(buildItem).toList(),
      ],
    );
  }

  PopupMenuItem<MenuItemPoup> buildItem(MenuItemPoup item) => PopupMenuItem(
        value: item,
        child: SizedBox(
          width: 20.w,
          height: 8.h,
          child: Row(
            children: [
              Icon(item.icon),
              Text(" "),
              Text(
                item.text,
                style: TextStyle(color: item.color),
              )
            ],
          ),
        ),
      );

  void onSelected(BuildContext context, MenuItemPoup item) {
    switch (item) {
      case MenuItems.itemUpdate:
        controller.productNameController.text = productName;
        controller.productCategoryController.text = category;
        controller.productQuantityController.text = quantity;
        controller.productPriceController.text = price;
        controller.productDescriptionController.text = description;
        controller.imgUrl = imageUrl;
        Get.to(
          EditProductScreen(
            productId: productId,
            productName: productName,
            category: category,
            price: price,
            quantity: quantity,
            description: description,
            imageUrl: imageUrl,
          ),
        );
        break;
      case MenuItems.itemDelete:
        controller.deleteData(productId, productName);
        break;
    }
  }
}
