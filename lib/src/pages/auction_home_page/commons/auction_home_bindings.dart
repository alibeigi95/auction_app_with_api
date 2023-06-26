import 'package:get/get.dart';

import '../controller/auction_home_controller.dart';


class AuctionHomePageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuctionHomePageController());
  }

}