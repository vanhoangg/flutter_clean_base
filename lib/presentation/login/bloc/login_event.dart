part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class ChangeUserNameEvent extends LoginEvent {
  final String username;

  const ChangeUserNameEvent(
    this.username,
  );
  @override
  List<Object> get props => [username];
}

final class ChangePasswordEvent extends LoginEvent {
  final String password;

  const ChangePasswordEvent(this.password);
  @override
  List<Object> get props => [password];
}

final class RequestLoginEvent extends LoginEvent {}
