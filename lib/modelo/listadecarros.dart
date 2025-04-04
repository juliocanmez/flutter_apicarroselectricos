class Car {
  final String id;
  final String model;
  final String brand;

  Car({required this.id, required this.model, required this.brand});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      model: json['model'],
      brand: json['brand'],
    );
  }
}
