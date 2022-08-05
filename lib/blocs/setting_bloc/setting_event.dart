part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingEvent {
  final Restaurant restaurant;
  const LoadSettings({
    required this.restaurant,
  });
  @override
  List<Object> get props => [restaurant];
}

class UpdateSettings extends SettingEvent {
  final Restaurant restaurant;
  const UpdateSettings({
    required this.restaurant,
  });
  @override
  List<Object> get props => [restaurant];
}

class UpdateOpeningHours extends SettingEvent {
  final OpeningHours openingHours;
  const UpdateOpeningHours({
    required this.openingHours,
  });
  @override
  List<Object> get props => [openingHours];
}
