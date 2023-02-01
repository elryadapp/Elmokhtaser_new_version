import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtasar/config/routes/app_routes.dart';
import 'package:elmokhtasar/core/errors/exceptions.dart';
import 'package:elmokhtasar/core/network/local/local.dart';
import 'package:elmokhtasar/core/utils/app_constants.dart';
import 'package:elmokhtasar/core/utils/app_utilities.dart';
import 'package:elmokhtasar/data/models/auth/error_model.dart';
import 'package:elmokhtasar/data/models/auth/user_data_model_request.dart';
import 'package:elmokhtasar/data/models/auth/user_data_model_response.dart';
import 'package:elmokhtasar/data/repoes/auth_repo.dart';
import 'package:elmokhtasar/generated/locale_keys.g.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPhoneNumberController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerPasswordConfirmController = TextEditingController();
  final registerEducationalLevelController = TextEditingController();
  final registerLevelController = TextEditingController();
  UserData? userModel;
  UserModel? userModelStatus; //response of regsiter

  String? verificationCode;
  final registerBasicInfoFormKey = GlobalKey<FormState>();

  //=======================complete info========================
  List<String> educationLevelList = [
    LocaleKeys.Auth_University_stage.tr(),
    LocaleKeys.Auth_High_school.tr(),
    LocaleKeys.Auth_Secondary_school.tr(),
    LocaleKeys.Auth_Primary_school.tr(),
    LocaleKeys.Auth_Kindergarten.tr()
  ];
  List<String> levelsList = [];
  void getLevelList(educationLevel) {
    if (educationLevel == LocaleKeys.Auth_University_stage.tr()) {
      levelsList = [
        LocaleKeys.Auth_student.tr(),
        LocaleKeys.Auth_graduate.tr()
      ];
    } else if (educationLevel == LocaleKeys.Auth_High_school.tr()) {
      levelsList = [
        LocaleKeys.Auth_First_grade_of_high.tr(),
        LocaleKeys.Auth_second_grade_of_high.tr(),
        LocaleKeys.Auth_third_grade_of_high.tr(),
        LocaleKeys.Auth_High_school_graduate.tr()
      ];
    } else if (educationLevel == LocaleKeys.Auth_Secondary_school.tr()) {
      levelsList = [
        LocaleKeys.Auth_First_grade_of_secondary.tr(),
        LocaleKeys.Auth_second_grade_of_secondary.tr(),
        LocaleKeys.Auth_third_grade_of_secondary.tr(),
      ];
    } else if (educationLevel == LocaleKeys.Auth_Primary_school.tr()) {
      levelsList = [
        LocaleKeys.Auth_First_grade_of_Primary.tr(),
        LocaleKeys.Auth_second_grade_of_Primary.tr(),
        LocaleKeys.Auth_third_grade_of_Primary.tr(),
        LocaleKeys.Auth_fourth_grade_of_Primary.tr(),
        LocaleKeys.Auth_fifth_grade_of_Primary.tr(),
        LocaleKeys.Auth_sixth_grade_of_Primary.tr()
      ];
    } else if (educationLevel == LocaleKeys.Auth_Kindergarten.tr()) {
      levelsList = [
        LocaleKeys.Auth_First_grade_of_Kindergarten.tr(),
        LocaleKeys.Auth_second_grade_of_Kindergarten.tr(),
        LocaleKeys.Auth_third_grade_of_Kindergarten.tr(),
      ];
    }
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future<void> authRegistration(context) async {
    emit(state.copyWith(registerStatus: RegisterStatus.loading));
    try {
      String? jwt = await messaging.getToken();
      //data that will be sent in register method
      RegisterDataModel registerDataModel = RegisterDataModel()
        ..name = registerNameController.text
        ..email = registerEmailController.text
        ..googleDeviceToken = jwt
        ..phone = registerPhoneNumberController.text
        ..password = registerPasswordController.text
        ..passwordConfirm = registerPasswordConfirmController.text
        ..educationLeve = registerEducationalLevelController.text
        ..level = registerLevelController.text;
      var res = await AuthRepositories.authRegister(
          query: registerDataModel.toJson());

      if (res['status'] < 300) {
        userModelStatus = UserModel.fromJson(res);
        userModel = userModelStatus!.data; //respnse
        defaultShowToast(
            message: LocaleKeys.Auth_code_alert.tr(),
            states: ToastStates.SUCCESS);
        verificationCode = userModelStatus!.data!.code.toString();

        Constants.tokenValue = userModel!.token ?? ''; //2

        await CacheHelper.assignData(
            key: Constants.tokenKey, value: userModelStatus!.data!.token); //3
        await CacheHelper.assignData(
            key: Constants.usernameKay, value: userModelStatus!.data!.name); //4
        Navigator.pushReplacementNamed(context, Routes.verification);
        registerNameController.text = '';
        registerEmailController.text = '';
        registerPhoneNumberController.text = '';
        registerPasswordController.text = '';
        registerPasswordConfirmController.text = '';
        registerEducationalLevelController.text = '';
        registerLevelController.text = '';
        emit(state.copyWith(
          registerStatus: RegisterStatus.success,
        ));
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(res);
        if (errorModel.data?.email != null) {
          defaultShowToast(
              message: errorModel.data?.email![0], states: ToastStates.ERORR);
        } else if (errorModel.data?.name != null) {
          defaultShowToast(
              message: errorModel.data?.name![0], states: ToastStates.ERORR);
        } else if (errorModel.data?.password != null) {
          defaultShowToast(
              message: errorModel.data?.password![0],
              states: ToastStates.ERORR);
        } else if (errorModel.data?.phone != null) {
          defaultShowToast(
              message: errorModel.data?.phone![0], states: ToastStates.ERORR);
        }
        emit(state.copyWith(registerStatus: RegisterStatus.failure));
      }
    } //
    catch (exception) {
      emit(state.copyWith(
        registerStatus: RegisterStatus.failure,
        exception: getExptionMessageMessage(exception),
      ));
    }
  }
}
