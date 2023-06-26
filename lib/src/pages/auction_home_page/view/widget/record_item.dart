import 'package:auction_app_with_api/src/pages/auction_home_page/view/widget/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auction_home_controller.dart';
import '../../models/auction_view_model.dart';
import 'alert_dialog.dart';

class AuctionRecordItem extends GetView<AuctionHomePageController> {
  final AuctionViewModel auctionRecord;

  const AuctionRecordItem({
    required this.auctionRecord,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: ColoredBox(
            color: Colors.blueGrey.shade50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(auctionRecord.name),
                      Text(auctionRecord.description),
                      Text(auctionRecord.basePrice.toString()),
                      SwitchButton(auctionRecord: auctionRecord,),
                      Text(auctionRecord.statusSoldType.name),
                      DialogExample(auctionRecord: auctionRecord),




                      // _popupMenu(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

/*Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/

/*  Widget _popupMenu() {
    return PopupMenuButton(
        onSelected: (selected) {
          controller.popupSelect(itemSelect:selected , weatherRecord: weatherRecord);
        },
        itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('edit'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('delete'),
              )
            ]);
  }*/
}
