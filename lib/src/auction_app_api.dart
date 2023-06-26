import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infrastructure/routes/route_names.dart';
import 'infrastructure/routes/route_pages.dart';



class AuctionAppApi extends StatelessWidget {
  const AuctionAppApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      GetMaterialApp(
        title: 'Auction app',
        initialRoute:RouteNames.homeAuction,
        getPages:RoutePages.pages,
      );
}
