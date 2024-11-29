part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? username;
  final String? password;
  final bool isValidatedAll;
  final BlocStatus status;
  final String? errorMessage;
  final UserEntity? userData;

  const LoginState({
    required this.username,
    required this.password,
    required this.isValidatedAll,
    required this.status,
    required this.userData,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [
        username.orEmpty(),
        password.orEmpty(),
        isValidatedAll,
        status,
        errorMessage ?? EMPTY,
        userData ?? [],
      ];

  LoginState copyWith({
    String? username,
    String? password,
    bool? isValidatedAll,
    BlocStatus? status,
    String? errorMessage,
    UserEntity? userData,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isValidatedAll: isValidatedAll ?? this.isValidatedAll,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userData: userData ?? this.userData,
    );
  }

  @override
  bool get stringify => true;

  factory LoginState.init() => const LoginState(
        username: EMPTY,
        password: EMPTY,
        isValidatedAll: false,
        status: BlocStatus.init,
        errorMessage: EMPTY,
        userData: null,
      );
  bool get isValidatedUserName => username?.isNotEmpty ?? false;
  bool get isValidatedPassWord => password?.isNotEmpty ?? false;
}
