import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_admin_panel/model/opening_hour_model.dart';
import 'package:restaurant_admin_panel/model/restaurant_model.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);
  }

  void _onLoadSettings(LoadSettings event, Emitter<SettingState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(SettingLoaded(event.restaurant));
  }

  void _onUpdateSettings(UpdateSettings event, Emitter<SettingState> emit) {
    emit(SettingLoaded(event.restaurant));
  }

  void _onUpdateOpeningHours(
      UpdateOpeningHours event, Emitter<SettingState> emit) {
    final state = this.state;
    if (state is SettingLoaded) {
      List<OpeningHours> openingHoursList =
          (state.restaurant.openingHours!.map((openingHours) {
        return openingHours.id == event.openingHours.id
            ? event.openingHours
            : openingHours;
      })).toList();
      emit(SettingLoaded(
          state.restaurant.copyWith(openingHours: openingHoursList)));
    }
  }
}
