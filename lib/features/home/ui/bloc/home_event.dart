part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.buyProxy() = _BuyProxy;
  const factory HomeEvent.changeStateButtons({
     required bool status,F

  })=_ChangeStateButtons;

}
