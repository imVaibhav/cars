// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return Vehicle(
    id: json['id'] as num,
    car: json['car'] as String,
    carModel: json['car_model'] as String,
    carColor: json['car_color'] as String,
    carModelYear: json['car_model_year'] as num,
    carVin: json['car_vin'] as String,
    price: json['price'] as String,
    availability: json['availability'] as bool,
  );
}

Map<String, dynamic> _$VehicleToJson(Vehicle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('car', instance.car);
  writeNotNull('car_model', instance.carModel);
  writeNotNull('car_color', instance.carColor);
  writeNotNull('car_model_year', instance.carModelYear);
  writeNotNull('car_vin', instance.carVin);
  writeNotNull('price', instance.price);
  writeNotNull('availability', instance.availability);
  return val;
}
