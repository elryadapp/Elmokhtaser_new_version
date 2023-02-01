import 'package:elmokhtasar/core/utils/app_constants.dart';
import 'package:elmokhtasar/data/models/auth/terms_and_conditions.dart';
import 'package:elmokhtasar/data/repoes/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

part 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
//login
  final loginFormKey = GlobalKey<FormState>();
  bool loginVisibality = true;
  IconData loginVisibilityIcon = Icons.visibility_outlined;
  void loginChangeVisibility() {
    loginVisibality = !loginVisibality;
    loginVisibilityIcon = !loginVisibality
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginVisibilityChangeState());
  }

//register
  double? animatedWidth;
  void changeAnimatedWidth(context) {
    if (currentInfoIndex == 0) {
      animatedWidth = Constants.getwidth(context) / 2 - 5.w;
    } else {
      animatedWidth = Constants.getwidth(context);
    }
    emit(ChangeInfoIndexState());
  }

  bool termsState = false;
  void onChangeConditionsAgrree(value) {
    termsState = value;
    emit(ChangetermsState());
  }

  int currentInfoIndex = 0;
  void changeIndex(index, context) {
    currentInfoIndex = index;
    changeAnimatedWidth(context);
    emit(ChangeInfoIndexState());
  }

  bool registerVisibility = true;
  bool registerVisibilityp = true;
  IconData registerVisibilityIcon = Icons.visibility_outlined;
  IconData registerVisibilityIconp = Icons.visibility_outlined;
  void registerChangeVisibility() {
    registerVisibility = !registerVisibility;
    registerVisibilityIcon = !registerVisibility
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterVisibilityChangeState());
  }

  void registerChangeVisibilityp() {
    registerVisibilityp = !registerVisibilityp;
    registerVisibilityIconp = !registerVisibilityp
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterVisibilitypChangeState());
  }
}
