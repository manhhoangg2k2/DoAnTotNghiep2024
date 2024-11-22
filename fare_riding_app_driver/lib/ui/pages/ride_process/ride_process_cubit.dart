import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ride_process_state.dart';

class RideProcessCubit extends Cubit<RideProcessState> {
  RideProcessCubit() : super(RideProcessInitial());
}
