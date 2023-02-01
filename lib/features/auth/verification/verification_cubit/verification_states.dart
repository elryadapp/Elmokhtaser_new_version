part of 'verification_cubit.dart';

enum VerificationStatus { initial, loading, success, failure }

class VerificationState {
  final VerificationStatus verificationStatus;
  final String? exception;
  final UserModel? userData;

  VerificationState(
      {this.verificationStatus = VerificationStatus.initial,
      this.exception,
      this.userData});

  VerificationState copyWith({
    final VerificationStatus? verificationStatus,
    final String? exception,
    final UserModel? userData,
  }) {
    return VerificationState(
        exception: exception ?? this.exception,
        verificationStatus: verificationStatus ?? this.verificationStatus,
        userData: userData ?? this.userData);
  }
}
