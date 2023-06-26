import '../../shared/status_sold_enum.dart';

class AddRecordDto {
  final String name, description;
  final int basePrice;
  final StatusSoldType statusSoldType;

  AddRecordDto({
    required this.statusSoldType,
    required this.basePrice,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'basePrice': basePrice,
        'soldStatus' : statusSoldType.value,
      };
}
