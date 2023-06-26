import '../../shared/status_sold_enum.dart';

class AuctionViewModel {
  final int id, basePrice;
  final String name, description;
  final StatusSoldType statusSoldType;

  AuctionViewModel({
    required this.id,
    required this.basePrice,
    required this.name,
    required this.description,
    required this.statusSoldType,
  });

  factory AuctionViewModel.fromJson(final Map<String, dynamic> json) {
    return AuctionViewModel(
        description: json['description'],
        name: json['name'],
        id: json['id'],
        basePrice: json['basePrice'],
        statusSoldType:
            StatusSoldType.getRecordTypeFromValue(json['soldStatus']));
  }
}
