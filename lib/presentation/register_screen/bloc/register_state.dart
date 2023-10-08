// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

/// Represents the state of Register in the application.
class RegisterState extends Equatable {
  RegisterState({
    this.userNameController,
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.englishName = false,
    this.registerModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  RegisterModel? registerModelObj;

  bool isShowPassword;

  bool englishName;

  @override
  List<Object?> get props => [
        userNameController,
        emailController,
        passwordController,
        isShowPassword,
        englishName,
        registerModelObj,
      ];
  RegisterState copyWith({
    TextEditingController? userNameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    bool? englishName,
    RegisterModel? registerModelObj,
  }) {
    return RegisterState(
      userNameController: userNameController ?? this.userNameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      englishName: englishName ?? this.englishName,
      registerModelObj: registerModelObj ?? this.registerModelObj,
    );
  }
}
