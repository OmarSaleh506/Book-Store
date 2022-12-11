import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/responsiveUiController.dart';

class SideBarMenu extends StatelessWidget {
  SideBarMenu({super.key});
  final responsiveController = Get.put(ResponsiveUiController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount:
              responsiveController.responsiveAttributes.crossAxisCount,
        ),
        children: [
          SizedBox(
            height: 20,
          ),
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              'Store Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Dashboard'),
          ),
          ListTile(
            leading: Icon(Icons.import_export),
            title: const Text('Stock'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark_added_sharp),
            title: const Text('Orders'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Customars'),
          ),
          SizedBox(height: 220),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: const Text('Jack Madsen'),
          ),
        ],
      ),
    );
  }
}
