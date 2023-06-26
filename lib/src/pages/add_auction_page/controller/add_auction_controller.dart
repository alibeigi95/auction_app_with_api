import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:either_dart/either.dart';
import '../../auction_home_page/models/auction_view_model.dart';
import '../../shared/status_sold_enum.dart';
import '../models/add_record_dto.dart';
import '../repositories/add_auction_repository.dart';

class AddAuctionController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController basePriceController = TextEditingController();
  final AddRecordRepository _repository = AddRecordRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  Rx<StatusSoldType> statusSoldType = StatusSoldType.unSold.obs;


  RxBool isGetAccountsLoading = true.obs, isSubmitLoading = false.obs;

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final AddRecordDto dto = AddRecordDto(
        basePrice: int.parse(basePriceController.text),
        name: nameController.text,
        description: descriptionController.text,
        statusSoldType: statusSoldType.value);

    final Either<String, AuctionViewModel> resultOrException =
        (await _repository.addRecords(dto));
    resultOrException.fold((String error) => print(error),
        (AuctionViewModel addRecord) {
      Get.back(result: {
        "id": addRecord.id,
        "name": addRecord.name,
        "description": addRecord.description,
        "basePrice": addRecord.basePrice,
        "soldStatus": addRecord.statusSoldType.value,
      });
    });
  }
}
