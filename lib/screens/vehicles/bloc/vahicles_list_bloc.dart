import 'package:bloc/bloc.dart';
import 'package:flutter_skills_test/model/vehicle_model.dart';
import 'package:flutter_skills_test/services/vehicle_service.dart';
import 'package:meta/meta.dart';

part 'vahicles_list_event.dart';
part 'vahicles_list_state.dart';

class VahicleslistBloc extends Bloc<VahicleslistEvent, VahicleslistState> {
  VahicleslistBloc() : super(VahicleslistInitial());
  List<Vehicle> list;
  @override
  Stream<VahicleslistState> mapEventToState(VahicleslistEvent event) async* {
    if (event is FetchVahiclesListEvent) {
      yield LoadingState();
      var data = await VehicleServices.fetchVehicles();
      if (data != null) {
        list = data;
        yield DataRetrivedState(data, 0);
      } else
        yield ErrorState("Someting went wrong!");
    } else if (event is ChangeCar) {
      yield DataRetrivedState(list, event.index);
    } else if (event is DeleteCar) {
      list.removeAt(event.index);

      yield DataRetrivedState(list, 0);
    } else if (event is EditCar) {
      yield LoadingState();

      var idx =
          list.indexWhere((element) => element.carModel == event.car.carModel);

      var temp = list.map((e) {
        if (e.carModel == event.car.carModel) {
          e.availability = event.car.availability;
          e.price = event.car.price;
        }
        return e;
      }).toList();
      yield DataRetrivedState(temp, idx);
    }
  }
}
