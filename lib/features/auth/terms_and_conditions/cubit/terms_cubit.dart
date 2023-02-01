import 'package:elmokhtasar/core/errors/exceptions.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/data/models/auth/terms_and_conditions.dart';
import 'package:elmokhtasar/data/repoes/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'terms_states.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsState());
  static TermsCubit get(context) => BlocProvider.of(context);

  TermsAndCondition? termsAndConditionModel;

  List<TermesAndConditionData> termesList = [];
  Future<void> getTermesData() async {
    emit(state.copyWith(termsStatus: TermsStatus.loading));
    try {
      var res = await AuthRepositories.getTermesData();
      if (res['status'] < 300) {
        termsAndConditionModel = TermsAndCondition.fromJson(res);
        termesList = termsAndConditionModel?.data ?? [];
        emit(state.copyWith(
            termsStatus: TermsStatus.success,
            termsAndConditionData: termsAndConditionModel));
      } else {
        defaultShowToast(
            message: res['data'].toString(), states: ToastStates.ERORR);
        emit(state.copyWith(termsStatus: TermsStatus.failure));
      }
    } catch (exception) {
      emit(state.copyWith(
        termsStatus: TermsStatus.failure,
        exception: getExptionMessageMessage(exception),
      ));
    }
  }
}
