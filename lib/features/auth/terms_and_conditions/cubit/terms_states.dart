part of 'terms_cubit.dart';

enum TermsStatus { initial, loading, success, failure }

class TermsState {
  final TermsStatus termsStatus;

  final String? exception;
  final TermsAndCondition? termsAndConditionData;

  TermsState(
      {this.termsStatus = TermsStatus.initial,
      this.exception,
      this.termsAndConditionData});

  TermsState copyWith({
    final TermsStatus? termsStatus,
    final String? exception,
    final TermsAndCondition? termsAndConditionData,
  }) {
    return TermsState(
        exception: exception ?? this.exception,
        termsStatus: termsStatus ?? this.termsStatus,
        termsAndConditionData:
            termsAndConditionData ?? this.termsAndConditionData);
  }
}
