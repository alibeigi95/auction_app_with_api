import 'package:get/get.dart';

import '../controller/add_auction_controller.dart';

class AddAuctionBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddAuctionController());
  }

}