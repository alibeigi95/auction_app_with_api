import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auction_home_controller.dart';
import '../../models/auction_view_model.dart';

class DialogExample extends GetView<AuctionHomePageController> {
  final AuctionViewModel auctionRecord;

  const DialogExample({required this.auctionRecord, super.key});

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('your deleted item'),
            content: const Text('are you sure you want to delete?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => controller.alertDialogSelect(
                    context: context, itemSelect: 2, record: auctionRecord),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Text('delete'),
      );
}
