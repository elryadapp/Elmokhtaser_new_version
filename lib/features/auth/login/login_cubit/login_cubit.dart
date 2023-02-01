import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/core/errors/exceptions.dart';
import 'package:elmokhtasar/core/network/local/local.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/data/models/auth/user_data_model_request.dart';
import 'package:elmokhtasar/data/models/auth/user_data_model_response.dart';

import 'package:elmokhtasar/data/repoes/auth_repo.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  UserModel? userLoginResponseData;
  Future<void> login(context) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    try {
      String? jwt = await messaging.getToken(); //jwt
      RegisterDataModel userLoginModel = RegisterDataModel()
        ..email = loginEmailController.text
        ..password = loginPasswordController.text
        ..googleDeviceToken = jwt;

      final res =
          await AuthRepositories.authLogin(query: userLoginModel.toJson());
      if (res['status'] < 300) {
        userLoginResponseData = UserModel.fromJson(res);

        Constants.tokenValue = userLoginResponseData!.data!.token!;
//user token in cache
        await CacheHelper.assignData(
            key: Constants.tokenKey,
            value: userLoginResponseData!.data!.token!);
//user name in cache
        await CacheHelper.assignData(
            key: Constants.usernameKay,
            value: userLoginResponseData!.data!.token!);
        loginEmailController.text = '';
        loginPasswordController.text = '';
        defaultShowToast(
            message: LocaleKeys.Auth_login_success.tr(),
            states: ToastStates.SUCCESS);
        emit(
          state.copyWith(
              loginStatus: LoginStatus.success,
              userData: userLoginResponseData),
        );
      } else {
        defaultShowToast(
            message: res['data'].toString(), states: ToastStates.ERORR);

        emit(state.copyWith(loginStatus: LoginStatus.failure));
      }
    } catch (exception) {
      emit(state.copyWith(
          exception: getExptionMessageMessage(exception),
          loginStatus: LoginStatus.failure));
    }
  }
}
