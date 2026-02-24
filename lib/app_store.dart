import 'package:flutter/foundation.dart';
import 'models/car.dart';
import 'models/rental.dart';

class AppStore extends ChangeNotifier {
  static final AppStore _instance = AppStore._internal();
  factory AppStore() => _instance;
  AppStore._internal() {
    _initSampleData();
  }

  final List<Car> _cars = [];
  final List<Rental> _rentals = [];

  List<Car> get cars => List.unmodifiable(_cars);
  List<Car> get availableCars => _cars.where((c) => c.isAvailable).toList();
  List<Rental> get rentals => List.unmodifiable(_rentals);
  List<Rental> get activeRentals =>
      _rentals.where((r) => r.status == 'active').toList();

  void _initSampleData() {
    _cars.addAll([
      Car(id: '1', name: 'Mazda RX-7',         color: 'Biru',  note: 'Edisi koleksi premium'),
      Car(id: '2', name: 'Lamborghini Huracán',   color: 'Kuning', note: 'Die-cast edisi terbatas'),
      Car(id: '3', name: 'Porsche 911',           color: 'Putih',   note: 'GT3 RS replika detail'),
      Car(id: '4', name: 'BMW M3',                color: 'Hitam',  note: 'Competition series'),
      Car(id: '5', name: 'Bugatti Chiron',        color: 'Hitam-Biru',  note: 'Super Sport premium'),
    ]);
  }

  // ── Cars CRUD ─────────────────────────────────────────────────────────────
  void addCar(Car car) {
    _cars.add(car);
    notifyListeners();
  }

  void updateCar(Car updatedCar) {
    final index = _cars.indexWhere((c) => c.id == updatedCar.id);
    if (index != -1) {
      _cars[index] = updatedCar;
      notifyListeners();
    }
  }

  void deleteCar(String carId) {
    _cars.removeWhere((c) => c.id == carId);
    notifyListeners();
  }

  Car? getCarById(String id) {
    try {
      return _cars.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  // ── Rentals CRUD ──────────────────────────────────────────────────────────
  void addRental({
    required Car car,
    required String renterName,
    required String renterPhone,
    required String renterAddress,
    required int durationMinutes,
  }) {
    final rental = Rental(
      id:              DateTime.now().millisecondsSinceEpoch.toString(),
      car:             car,
      renterName:      renterName,
      renterPhone:     renterPhone,
      renterAddress:   renterAddress,
      startTime:       DateTime.now(),
      durationMinutes: durationMinutes,
    );
    _rentals.add(rental);
    car.isAvailable = false;
    notifyListeners();
  }

  void returnCar(String rentalId) {
    final rental = _rentals.firstWhere((r) => r.id == rentalId);
    rental.status = 'returned';
    rental.car.isAvailable = true;
    notifyListeners();
  }

  void deleteRental(String rentalId) {
    final rental = _rentals.firstWhere((r) => r.id == rentalId);
    if (rental.status == 'active') rental.car.isAvailable = true;
    _rentals.removeWhere((r) => r.id == rentalId);
    notifyListeners();
  }

  Rental? getRentalById(String id) {
    try {
      return _rentals.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }
}
