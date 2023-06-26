import 'package:auction_app_with_api/src/pages/auction_home_page/view/widget/record_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/auction_home_controller.dart';



class AuctionRecordList extends GetView<AuctionHomePageController> {
  const AuctionRecordList({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
            itemCount: controller.auctionRecords.length,
            itemBuilder: (final context, final index) =>
                AuctionRecordItem(auctionRecord: controller.auctionRecords[index])),
      );
}