part of 'vahicles_list_bloc.dart';

@immutable
abstract class VahicleslistEvent {}

class FetchVahiclesListEvent extends VahicleslistEvent {
  List<Vehicle> data;
}

class ChangeCar extends VahicleslistEvent {
  int index;
  ChangeCar(this.index);
}

class DeleteCar extends VahicleslistEvent {
  int index;
  DeleteCar(this.index);
}

class EditCar extends VahicleslistEvent {
  Vehicle car;
  EditCar(this.car);
}
