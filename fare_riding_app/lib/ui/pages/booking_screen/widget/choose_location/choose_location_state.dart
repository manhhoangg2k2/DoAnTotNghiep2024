part of 'choose_location_cubit.dart';

@immutable
class ChooseLocationState {
  final List<String?> placeAutofillList;

  const ChooseLocationState({
    this.placeAutofillList = const [],
  });

  ChooseLocationState copyWith({List<String?>? placeAutofillList}) {
    return ChooseLocationState(
      placeAutofillList: placeAutofillList ?? this.placeAutofillList,
    );
  }
}
