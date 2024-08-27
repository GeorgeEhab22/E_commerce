abstract class LoginState {
  const LoginState();
}

// Initial state when the login process has not started yet
class LoginInitial extends LoginState {}

// State when the login process is loading
class LoginLoading extends LoginState {}

// State when the login is successful
class LoginSuccess extends LoginState {}

// State when there is an error in the login process
class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
}
