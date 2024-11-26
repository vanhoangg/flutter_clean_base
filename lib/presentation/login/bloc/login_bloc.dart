import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../app/constant.dart';
import '../../../app/extensions.dart';
import '../../../domain/entity/entity.dart';
import '../../../domain/usecase/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginState.init()) {
    on<ChangeUserNameEvent>(_onUsernameChanged);
    on<ChangePasswordEvent>(_onPasswordChanged);
    on<RequestLoginEvent>(_onRequestLoginEvent);
  }
  bool _validateForm(String? username, String? password) {
    return username.orEmpty().isNotEmpty && password.orEmpty().isNotEmpty;
  }

  void _onUsernameChanged(ChangeUserNameEvent event, Emitter<LoginState> emit) {
    final updatedState = state.copyWith(
      username: event.username,
      isValidatedAll: _validateForm(event.username, state.password),
    );
    emit(updatedState);
  }

  void _onPasswordChanged(ChangePasswordEvent event, Emitter<LoginState> emit) {
    final updatedState = state.copyWith(
      password: event.password,
      isValidatedAll: _validateForm(state.username, event.password),
    );
    emit(updatedState);
  }

  FutureOr<void> _onRequestLoginEvent(
      RequestLoginEvent event, Emitter<LoginState> emit) async {
    if (_validateForm(state.username.orEmpty(), state.password.orEmpty()) ==
        false) {
      return;
    }
    print('Username in state: ${state.username}');

    emit(state.copyWith(status: BlocStatus.loading));
    print('Username after state: ${state.username}');

    try {
      await Future.delayed(const Duration(seconds: 2));
      await _loginUseCase.execute(
        LoginUseCaseInput(state.username.orEmpty(), state.password.orEmpty()),
      )
        ..fold(
          (failure) => emit(
            state.copyWith(
                status: BlocStatus.failed, errorMessage: failure.message),
          ),
          (success) {
            emit(
              state.copyWith(status: BlocStatus.success, userData: success),
            );
          },
        );
    } catch (e) {
      emit(
        state.copyWith(status: BlocStatus.failed, errorMessage: e.toString()),
      );
    }
  }
}
