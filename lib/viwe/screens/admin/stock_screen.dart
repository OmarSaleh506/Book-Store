import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/prodect_controller.dart';
import '../../../model/product_model.dart';
import '../../../routes/route.dart';
import '../../widgets/product/admin/stock/empty_screen.dart';
import '../../widgets/product/admin/stock/products_in_stock.dart';
import '../../widgets/product/side_bar_menu.dart';

class StockScreen extends StatelessWidget {
  StockScreen({Key? key}) : super(key: key);
  final controller = Get.put(variable());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 154,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Stock",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.addProductForm);
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: controller.getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("not empty screen");
            controller.products = snapshot.data!.docs
                .map(
                  (e) => Product(
                    productNumber: e['productNumber'],
                    productName: e['productName'],
                    description: e['description'],
                    category: e['category'],
                    price: e['price'],
                    quantity: e['quantity'],
                    imageUrl: e['imageUrl'],
                  ),
                )
                .toList();
            print("prodects.length ${controller.products.length}");

            if (controller.products.isNotEmpty) {
              return ProuctsInStock(
                products: controller.products,
              );
            } else {
              print("empty screen");
              return EmptyScreen();
            }
          } else {
            print("products gg ${controller.products.length}");
            return ProuctsInStock(
              products: controller.products,
            );
          }
        },
      ),
      drawer: SideBarMenu(),
    );
  }
}
