

enum StatusSoldType {
  unSold(
    value: 1,
    name: 'unSold',
  ),
  sold(
    value: 2,
    name: 'sold',
  ),
  none(
    value: 0,
    name: 'none',
  );

  const StatusSoldType({
    required this.value,
    required this.name,
  });

  final int value;
  final String name;

  static StatusSoldType getRecordTypeFromValue(int value) {
    if (value == 1) return StatusSoldType.unSold;
    if (value == 2) return StatusSoldType.sold;


    return StatusSoldType.none;
  }
}
