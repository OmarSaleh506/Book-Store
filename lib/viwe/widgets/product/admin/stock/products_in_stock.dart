import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../logic/controllers/prodect_controller.dart';
import '../../../../../logic/controllers/responsiveUiController.dart';
import '../popup_menu.dart';

class ProuctsInStock extends StatelessWidget {
  List<dynamic> products;
  ProuctsInStock({super.key, required this.products});
  final controller = Get.find<variable>();
  final responsiveController = Get.put(ResponsiveUiController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<variable>(
      builder: (_) => GridView.builder(
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 20.h,
                  // width: 6.w,
                  margin: EdgeInsets.only(left: 0.w),
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
                  width: 1.w,
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
                                fontSize: responsiveController
                                    .responsiveAttributes.headline3,
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
                        height: 1.h,
                      ),
                      Text(
                        "${products[index].productName}",
                        style: TextStyle(
                          fontSize: responsiveController
                              .responsiveAttributes.headline3,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "${products[index].category}",
                        style: TextStyle(
                          fontSize: responsiveController
                              .responsiveAttributes.headline3,
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
                            fontSize: responsiveController
                                .responsiveAttributes.headline3,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text("\$${products[index].price}",
                              style: TextStyle(
                                  fontSize: responsiveController
                                      .responsiveAttributes.headline3,
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 1,
          crossAxisCount:
              responsiveController.responsiveAttributes.crossAxisCount,
        ),
      ),
    );
  }
}
