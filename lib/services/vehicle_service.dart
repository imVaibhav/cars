import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_skills_test/model/vehicle_model.dart';
import 'package:flutter_skills_test/services/generic_service.dart';

class VehicleServices extends GenericService {
  static VehicleServices _instance = VehicleServices._();

  VehicleServices._();

  static Future<List<Vehicle>> fetchVehicles() async {
    List<Vehicle> list;

    // List<Vehicle> list = await Vehicle.staticData();
    var response = await http.get('https://myfakeapi.com/api/cars/');
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      list = jsonData['cars']
          .map<Vehicle>((e) => Vehicle.fromJson(e))
          .toList()
          .sublist(0, 9);
    } else
      list = Vehicle.staticData();
    return list;
  }
}
