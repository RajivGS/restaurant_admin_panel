part of 'setting_bloc.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingLoading extends SettingState {}

class SettingLoaded extends SettingState {
  final Restaurant restaurant;
  const SettingLoaded(this.restaurant);
  @override
  List<Object> get props => [restaurant];
}
