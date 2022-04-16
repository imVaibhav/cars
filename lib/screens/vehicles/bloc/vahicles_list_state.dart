part of 'vahicles_list_bloc.dart';

@immutable
abstract class VahicleslistState {}

class VahicleslistInitial extends VahicleslistState {}

class LoadingState extends VahicleslistState {}

class ErrorState extends VahicleslistState {
  String msg;
  ErrorState(this.msg);
}

class DataRetrivedState extends VahicleslistState {
  List<Vehicle> data;
  int index;
  DataRetrivedState(this.data, this.index);
}
