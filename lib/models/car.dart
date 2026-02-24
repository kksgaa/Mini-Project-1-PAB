class Car {
  final String id;
  String name;
  String color;
  String note;
  bool isAvailable;

  static const double pricePerSession = 20000;

  Car({
    required this.id,
    required this.name,
    required this.color,
    this.note = '',
    this.isAvailable = true,
  });

  Car copyWith({
    String? name,
    String? color,
    String? note,
    bool? isAvailable,
  }) {
    return Car(
      id: id,
      name: name ?? this.name,
      color: color ?? this.color,
      note: note ?? this.note,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
