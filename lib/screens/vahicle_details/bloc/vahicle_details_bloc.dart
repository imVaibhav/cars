import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vahicle_details_event.dart';
part 'vahicle_details_state.dart';

class VahicledetailsBloc
    extends Bloc<VahicledetailsEvent, VahicledetailsState> {
  VahicledetailsBloc() : super(VahicledetailsInitial()) {
    on<VahicledetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
