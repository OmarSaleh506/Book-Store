import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/prodect_controller.dart';
import '../../../model/product_model.dart';
import '../../widgets/product/search_products.dart';
import 'cart_item_customer.dart';
import 'favourites/prodects_favourites.dart';

class CustomerHome extends StatelessWidget {
  CustomerHome({Key? key}) : super(key: key);
  final controller = Get.put(variable());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 145,
        iconTheme: IconThemeData(color: Colors.black),
        title: SearchProducts(),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print(controller.favoritesList);
              Get.to(prodectsFavourites());
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.products = snapshot.data!.docs
                    .map(
                      (e) => Product(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        category: e['category'],
                        quantity: e['quantity'],
                        price: e['price'],
                        description: e['description'],
                        imageUrl: e['imageUrl'],
                      ),
                    )
                    .toList();

                print('leeength ${controller.products.length}');
                if (controller.products.isNotEmpty) {
                  return CardItem(products: controller.products);
                } else {
                  return const Text("No thing");
                }
              } else {
                return CardItem(products: controller.products);
              }
            },
          ),
        ],
      ),
    );
  }
}
