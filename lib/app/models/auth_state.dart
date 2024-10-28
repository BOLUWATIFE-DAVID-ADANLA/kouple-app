import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthenticationState {
  const AuthStateInitial();

  @override
  List<Object?> get props => [];
}

class AuthstateLoding extends AuthenticationState {
  const AuthstateLoding();
  @override
  List<Object?> get props => [];
}

class AuthstateError extends AuthenticationState {
  final String message;
  const AuthstateError(this.message);
  @override
  List<Object?> get props => [];
}

class AuthstateSuccess extends AuthenticationState {
  const AuthstateSuccess();
  @override
  List<Object?> get props => [];
}
