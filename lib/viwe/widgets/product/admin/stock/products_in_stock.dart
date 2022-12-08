import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../logic/controllers/prodect_controller.dart';
import '../popup_menu.dart';

class ProuctsInStock extends StatelessWidget {
  List<dynamic> products;
  ProuctsInStock({super.key, required this.products});
  final controller = Get.find<variable>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<variable>(
      builder: (_) => ListView.builder(
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
            height: 138,
            width: 393,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 106,
                  width: 96,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: NetworkImage('${products[index].imageUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "${products[index].productNumber}",
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            PopupMenu(
                              productId: '${products[index].productNumber}',
                              productName: '${products[index].productName}',
                              category: '${products[index].category}',
                              quantity: '${products[index].quantity}',
                              price: '${products[index].price}',
                              description: '${products[index].description}',
                              imageUrl: '${products[index].imageUrl}',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${products[index].productName}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${products[index].category}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${products[index].quantity}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("\$${products[index].price}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 1))),
                          Spacer(),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              print(products[index].price);
                            },
                            activeTrackColor: Color.fromRGBO(67, 24, 255, 1),
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
