// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

/// Represents the state of LogIn in the application.
class LogInState extends Equatable {
  LogInState({
    this.userNameController,
    this.passwordController,
    this.isShowPassword = true,
    this.englishLabel = false,
    this.logInModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  LogInModel? logInModelObj;

  bool isShowPassword;

  bool englishLabel;

  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        isShowPassword,
        englishLabel,
        logInModelObj,
      ];
  LogInState copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    bool? englishLabel,
    LogInModel? logInModelObj,
  }) {
    return LogInState(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      englishLabel: englishLabel ?? this.englishLabel,
      logInModelObj: logInModelObj ?? this.logInModelObj,
    );
  }
}
