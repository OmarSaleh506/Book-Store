import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../logic/controllers/prodect_controller.dart';
import '../../../../logic/controllers/responsiveUiController.dart';
import '../../../widgets/product/admin/stock/empty_screen.dart';

class prodectsFavourites extends StatelessWidget {
  prodectsFavourites({super.key});
  final controller = Get.put(variable());
  final responsiveController = Get.put(ResponsiveUiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 145,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Favorite",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: controller.favoritesList.isNotEmpty
          ? GridView.builder(
              itemCount: controller.favoritesList.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                  height: 138,
                  width: 393,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20)),
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
                                image: NetworkImage(
                                    '${controller.favoritesList[index]['imageUrl']}'),
                                fit: BoxFit.cover)),
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
                                    "${controller.favoritesList[index]['productName']}",
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      controller.favoritesList.removeAt(index);
                                      controller.check = true;
                                    },
                                    icon: const Icon(Icons.delete_forever),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${controller.favoritesList[index]['category']}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                    "\$${controller.favoritesList[index]['price']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                                Spacer(),
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
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount:
                    responsiveController.responsiveAttributes.crossAxisCount,
              ),
            )
          : EmptyScreen(),
    );
  }
}
