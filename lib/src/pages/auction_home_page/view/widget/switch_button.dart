import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auction_home_controller.dart';
import '../../models/auction_view_model.dart';

class SwitchButton extends GetView<AuctionHomePageController> {
  const SwitchButton({required this.auctionRecord, Key? key}) : super(key: key);
  final AuctionViewModel auctionRecord;


  @override
  Widget build(BuildContext context) => Obx(
        () => Switch(
          value: controller.switchValue[auctionRecord.id]!,
          activeColor: Colors.blue,
          onChanged: (bool value) {
            controller.switchSelect(record: auctionRecord, value: value);
          },
        ),
      );
}
