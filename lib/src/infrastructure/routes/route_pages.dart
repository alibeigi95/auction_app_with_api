import 'package:get/get.dart';
import '../../pages/add_auction_page/commons/add_auction_bindings.dart';
import '../../pages/add_auction_page/view/add_auction_page.dart';
import '../../pages/auction_home_page/commons/auction_home_bindings.dart';
import '../../pages/auction_home_page/view/auction_home_page.dart';
import 'route_names.dart';

class RoutePages {
  static final List<GetPage> pages = [
    GetPage(
      name: RouteNames.homeAuction,
      page: () => const AuctionHomePage(),
      binding: AuctionHomePageBindings(),
      children: [
        GetPage(
          name: RouteNames.addAuction,
          page: () => const AddAuctionPage(),
          binding: AddAuctionBindings(),
        ),

      ],
    ),
  ];
}