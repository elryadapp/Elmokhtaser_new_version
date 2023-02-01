import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/core/errors/exceptions.dart';
import 'package:elmokhtasar/core/network/local/local.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/data/models/auth/user_data_model_request.dart';
import 'package:elmokhtasar/data/models/auth/user_data_model_response.dart';
import 'package:elmokhtasar/data/repoes/auth_repo.dart';
import 'package:elmokhtasar/features/auth/register/register_cubit/register_cubit.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_states.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationState());
  static VerificationCubit get(context) => BlocProvider.of(context);
  final codeControllers = List.generate(5, (index) => TextEditingController());

  UserData? verifyUserModel;

  Future<void> authVerify(context) async {
    emit(state.copyWith(verificationStatus: VerificationStatus.loading));
    try {
      RegisterDataModel userLoginModelv = RegisterDataModel()
        ..phone = RegisterCubit.get(context).userModelStatus!.data!.phone
        ..code = codeControllers.map((e) => e.text).toList().join();

      var res = await AuthRepositories.authVerification(
        query: userLoginModelv.toJson(), //??
      );

      if (res['status'] == 200) {
        verifyUserModel = UserData.fromJson(res);

        defaultShowToast(
            message: LocaleKeys.Auth_login_success.tr(),
            states: ToastStates.SUCCESS);
        CacheHelper.assignData(
            key: Constants.tokenKey, value: verifyUserModel!.token);

        Navigator.pushReplacementNamed(context, Routes.layout);
        emit(state.copyWith(verificationStatus: VerificationStatus.success));
      } else {
        defaultShowToast(message: res['data'], states: ToastStates.ERORR);

        emit(state.copyWith(verificationStatus: VerificationStatus.failure));
      }
    } catch (exception) {
      emit(state.copyWith(
        exception: getExptionMessageMessage(exception),
      ));
    }
  }
}
