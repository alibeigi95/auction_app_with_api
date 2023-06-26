import '../../shared/status_sold_enum.dart';

class EditRecordDto {
  final String name, description;
  final int basePrice, id;
  final StatusSoldType statusSoldType;

  EditRecordDto({
    required this.id,
    required this.statusSoldType,
    required this.basePrice,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'basePrice': basePrice,
        'soldStatus': statusSoldType.value,
      };
}
