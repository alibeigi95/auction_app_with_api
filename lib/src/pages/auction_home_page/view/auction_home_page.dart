import 'package:auction_app_with_api/src/pages/auction_home_page/view/widget/record_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/auction_home_controller.dart';

class AuctionHomePage extends GetView<AuctionHomePageController> {
  const AuctionHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Weather app')),
        body: const Column(
          children: [
            Expanded(flex: 2, child: AuctionRecordList()),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.goToAddAuctionPage(context),
          child: const Icon(Icons.add),
        ),
      );
}
