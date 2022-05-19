part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required final bool isSubmitting,
    required final bool noInternet,
    required final bool serverError,
    required final bool isOnButton,
    required final bool isHaveProxy,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        isSubmitting: false,
        isHaveProxy: false,
        isOnButton: false,
        noInternet: false,
        serverError: false,
      );
}
