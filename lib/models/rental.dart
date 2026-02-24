import 'car.dart';

class Rental {
  final String id;
  final Car car;
  String renterName;
  String renterPhone;
  String renterAddress;
  DateTime startTime;
  int durationMinutes;
  String status;

  Rental({
    required this.id,
    required this.car,
    required this.renterName,
    required this.renterPhone,
    required this.renterAddress,
    required this.startTime,
    required this.durationMinutes,
    this.status = 'active',
  });

  DateTime get endTime => startTime.add(Duration(minutes: durationMinutes));
  double get totalPrice => (durationMinutes / 15) * Car.pricePerSession;
  int get sessions => durationMinutes ~/ 15;
}
