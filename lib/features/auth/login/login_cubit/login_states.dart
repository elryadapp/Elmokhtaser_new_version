part of 'login_cubit.dart';


enum LoginStatus { initial, loading, success, failure }
class LoginState {
  final LoginStatus loginStatus;

  final String? exception;
  final UserModel? userData;

  LoginState({this.loginStatus=LoginStatus.initial,
  
    this.exception,
     this.userData});

  LoginState copyWith({
  final LoginStatus? loginStatus,
  final String? exception,
  final UserModel? userData,

  }){
    return LoginState(
      exception: exception??this.exception,
      loginStatus: loginStatus??this.loginStatus,
      userData: userData??this.userData

    );

  }
  


}
