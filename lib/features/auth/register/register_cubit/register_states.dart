part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState {
  RegisterStatus registerStatus;

  final String? exception;
  final UserModel? userData;

  RegisterState(
      {this.registerStatus = RegisterStatus.initial,
      this.exception,
      this.userData});

  RegisterState copyWith({
    final RegisterStatus? registerStatus,
    final String? exception,
    final UserModel? userData,
  }) {
    return RegisterState(
        exception: exception ?? this.exception,
        registerStatus:
            registerStatus ?? this.registerStatus, //value of class attributte
        userData: userData ?? this.userData);
  }
}
