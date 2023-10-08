import 'package:auth_mobile_app/core/app_export.dart';
import 'package:auth_mobile_app/core/utils/validation_functions.dart';
import 'package:auth_mobile_app/widgets/custom_checkbox_button.dart';
import 'package:auth_mobile_app/widgets/custom_elevated_button.dart';
import 'package:auth_mobile_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'bloc/log_in_bloc.dart';
import 'models/log_in_model.dart';

// ignore_for_file: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(LogInState(logInModelObj: LogInModel()))
          ..add(LogInInitialEvent()),
        child: LogInScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(
                          height: 248.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                        height: 199.v,
                                        width: double.maxFinite,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgRectangle1135,
                                                  height: 199.v,
                                                  width: 393.h,
                                                  radius: BorderRadius.circular(
                                                      10.h),
                                                  alignment: Alignment.center),
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgGraphics,
                                                  height: 199.v,
                                                  width: 393.h,
                                                  alignment: Alignment.center)
                                            ]))),
                                CustomImageView(
                                    imagePath: ImageConstant.imgRectangle1136,
                                    height: 116.adaptSize,
                                    width: 116.adaptSize,
                                    radius: BorderRadius.circular(8.h),
                                    alignment: Alignment.bottomCenter)
                              ])),
                      SizedBox(height: 25.v),
                      Text("msg_log_in_to_your_account".tr,
                          style: theme.textTheme.titleLarge),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.h, top: 20.v, right: 24.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_username".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray400),
                                SizedBox(height: 7.v),
                                BlocSelector<LogInBloc, LogInState,
                                        TextEditingController?>(
                                    selector: (state) =>
                                        state.userNameController,
                                    builder: (context, userNameController) {
                                      return CustomTextFormField(
                                          controller: userNameController,
                                          hintText: "lbl_ahmed0saber".tr,
                                          suffix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 14.v, 8.h, 14.v),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgClose)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 44.v));
                                    })
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.h, top: 22.v, right: 24.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_password".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray400),
                                SizedBox(height: 7.v),
                                BlocBuilder<LogInBloc, LogInState>(
                                    builder: (context, state) {
                                  return CustomTextFormField(
                                      controller: state.passwordController,
                                      hintText: "lbl".tr,
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      suffix: InkWell(
                                          onTap: () {
                                            context.read<LogInBloc>().add(
                                                ChangePasswordVisibilityEvent(
                                                    value:
                                                        !state.isShowPassword));
                                          },
                                          child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 14.v, 8.h, 14.v),
                                              child: CustomImageView(
                                                  svgPath: state.isShowPassword
                                                      ? ImageConstant
                                                          .imgCheckmark
                                                      : ImageConstant
                                                          .imgCheckmark))),
                                      suffixConstraints:
                                          BoxConstraints(maxHeight: 44.v),
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidPassword(value,
                                                isRequired: true))) {
                                          return "Please enter valid password";
                                        }
                                        return null;
                                      },
                                      obscureText: state.isShowPassword);
                                })
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.h, top: 22.v, right: 24.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocSelector<LogInBloc, LogInState, bool?>(
                                    selector: (state) => state.englishLabel,
                                    builder: (context, englishLabel) {
                                      return CustomCheckboxButton(
                                          text: "lbl_remember_me".tr,
                                          value: englishLabel,
                                          margin: EdgeInsets.only(bottom: 1.v),
                                          onChange: (value) {
                                            context.read<LogInBloc>().add(
                                                ChangeCheckBoxEvent(
                                                    value: value));
                                          });
                                    }),
                                SizedBox(
                                    height: 17.v,
                                    width: 123.h,
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "msg_forgot_password".tr,
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: 123.h,
                                                  child: Divider()))
                                        ]))
                              ])),
                      CustomElevatedButton(
                          text: "lbl_log_in".tr,
                          margin: EdgeInsets.only(
                              left: 24.h, top: 20.v, right: 24.h),
                          onTap: () {
                            login(context);
                          }),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.h, top: 22.v, bottom: 5.v),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 1.v),
                                    child: Text("msg_don_t_have_an_account".tr,
                                        style: theme.textTheme.bodyMedium)),
                                Container(
                                    height: 17.v,
                                    width: 58.h,
                                    margin: EdgeInsets.only(left: 6.h),
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () =>
                                                    NavigatorService.pushNamed(
                                                        AppRoutes
                                                            .registerScreen),
                                                child: Text("lbl_register".tr,
                                                    style: theme
                                                        .textTheme.titleSmall),
                                              )),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: 58.h,
                                                  child: Divider()))
                                        ]))
                              ])))
                    ])))));
  }

  /// Calls the https://dummyjson.com/auth/login API and triggers a [CreateLoginEvent] event on the [LogInBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateLoginEvent] event on the [LogInBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  login(BuildContext context) {
    context.read<LogInBloc>().add(
          CreateLoginEvent(
            onCreateLoginEventSuccess: () {
              _onLoginDeviceAuthEventSuccess(context);
            },
            onCreateLoginEventError: () {
              _onLoginDeviceAuthEventError(context);
            },
          ),
        );
  }

  /// Navigates to the profileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the profileScreen.
  void _onLoginDeviceAuthEventSuccess(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Displays an alert dialog when the action is triggered.
  /// The dialog box contains a title and a message with the `We couldn't sign you in please try again later`
  void _onLoginDeviceAuthEventError(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Error'),
              content:
                  const Text('We couldn\'t sign you in please try again later'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'))
              ],
            ));
  }
}
