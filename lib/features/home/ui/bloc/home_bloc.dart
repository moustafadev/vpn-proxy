import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            noInternet: false,
            isSubmitting: true,
          ),
        );
        event.map(started: (event) {
          state.copyWith(
            isSubmitting: true,
          );
        }, buyProxy: (event) {
          emit(
            state.copyWith(
              noInternet: true,
              isSubmitting: false,
              isHaveProxy: true,
            ),
          );
        }, changeStateButtons: (event) {
          emit(
            state.copyWith(
              noInternet: true,
              isSubmitting: false,
              isHaveProxy: true,
              isOnButton: event.status,
            ),
          );
        });
      },
    );
  }
}
