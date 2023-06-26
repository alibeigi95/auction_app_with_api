import 'package:auction_app_with_api/src/pages/shared/status_sold_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../models/auction_view_model.dart';

import '../models/edit_record_dto.dart';
import '../repositories/auction_home_page_repository.dart';

class AuctionHomePageController extends GetxController {
  RxList<AuctionViewModel> auctionRecords = RxList();
  final AuctionHomePageRepository _repository = AuctionHomePageRepository();

  RxMap<int, bool> switchValue = RxMap();

  void switchSelect({required AuctionViewModel record, required bool value}) {
    switchValue[record.id] = value;
  }

/*  Future<void> edit() async {
    final dto = _generateEditRecordDto();
    final recordId = (await _repository.editRecords(dto));
  }

  EditRecordDto _generateEditRecordDto() =>
      EditRecordDto(id:, statusSoldType:, basePrice:, name:, description:);*/

  @override
  void onInit() {
    super.onInit();
    getAuctionRecords();
  }

  Future<void> getAuctionRecords() async {
    auctionRecords.clear();
    final result = await _repository.getAuctionRecords();
    if (result.isLeft) {
      print('error');
    } else if (result.isRight) {
      auctionRecords.addAll(result.right);

      for (final item in result.right) {
        switchValue[item.id] =
        item.statusSoldType == StatusSoldType.sold ? true : false;
      }
    }

  }

  Future<void> deleteAuctionRecord(AuctionViewModel record) async {
    final result = await _repository.deleteAuctionRecords(record.id);

    if (result.right == 'success') {
      auctionRecords.remove(record);
    } else {
      Get.snackbar('error', result.left);
    }
  }

  void alertDialogSelect({
    required int itemSelect,
    required AuctionViewModel record,
    required BuildContext context,
  }) {
    switch (itemSelect) {
      case 1:
        break;
      case 2:
        deleteAuctionRecord(record);
        Navigator.of(context).pop();
        break;
    }
  }

  Future<void> goToAddAuctionPage(BuildContext context) async {
    final result = await Get.toNamed<dynamic>(
        '${RouteNames.homeAuction}${RouteNames.addAuction}');

    final AuctionViewModel newAuction = AuctionViewModel.fromJson(result);
    auctionRecords.add(newAuction);
  }
}
