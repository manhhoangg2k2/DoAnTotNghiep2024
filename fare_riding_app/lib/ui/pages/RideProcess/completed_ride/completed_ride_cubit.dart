import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'completed_ride_state.dart';

class CompletedRideCubit extends Cubit<CompletedRideState> {
  CompletedRideCubit() : super(CompletedRideInitial());
}
