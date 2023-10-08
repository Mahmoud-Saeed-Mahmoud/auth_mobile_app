import 'package:auth_mobile_app/core/app_export.dart';
import 'package:auth_mobile_app/core/utils/validation_functions.dart';
import 'package:auth_mobile_app/widgets/custom_checkbox_button.dart';
import 'package:auth_mobile_app/widgets/custom_elevated_button.dart';
import 'package:auth_mobile_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'bloc/register_bloc.dart';
import 'models/register_model.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (context) =>
            RegisterBloc(RegisterState(registerModelObj: RegisterModel()))
              ..add(RegisterInitialEvent()),
        child: RegisterScreen());
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
                      SizedBox(height: 24.v),
                      Text("msg_create_new_account".tr,
                          style: theme.textTheme.titleLarge),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.h, top: 22.v, right: 24.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_username".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray400),
                                SizedBox(height: 7.v),
                                BlocSelector<RegisterBloc, RegisterState,
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
                                Text("lbl_email".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray400),
                                SizedBox(height: 7.v),
                                BlocSelector<RegisterBloc, RegisterState,
                                        TextEditingController?>(
                                    selector: (state) => state.emailController,
                                    builder: (context, emailController) {
                                      return CustomTextFormField(
                                          controller: emailController,
                                          hintText:
                                              "msg_ahmed0saber33_gmail_com".tr,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          suffix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 14.v, 8.h, 14.v),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgClose)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 44.v),
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidEmail(value,
                                                    isRequired: true))) {
                                              return "Please enter valid email";
                                            }
                                            return null;
                                          });
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
                                BlocBuilder<RegisterBloc, RegisterState>(
                                    builder: (context, state) {
                                  return CustomTextFormField(
                                      controller: state.passwordController,
                                      hintText: "lbl".tr,
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      suffix: InkWell(
                                          onTap: () {
                                            context.read<RegisterBloc>().add(
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
                                BlocSelector<RegisterBloc, RegisterState,
                                        bool?>(
                                    selector: (state) => state.englishName,
                                    builder: (context, englishName) {
                                      return CustomCheckboxButton(
                                          text: "lbl_remember_me".tr,
                                          value: englishName,
                                          margin: EdgeInsets.only(bottom: 1.v),
                                          onChange: (value) {
                                            context.read<RegisterBloc>().add(
                                                ChangeCheckBoxEvent(
                                                    value: value));
                                          });
                                    }),
                                SizedBox(
                                    height: 17.v,
                                    width: 114.h,
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "lbl_have_a_problem".tr,
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: 114.h,
                                                  child: Divider()))
                                        ]))
                              ])),
                      CustomElevatedButton(
                          text: "lbl_register".tr,
                          margin: EdgeInsets.only(
                              left: 24.h, top: 20.v, right: 24.h),
                          onTap: () {
                            registerUser(context);
                          }),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.h, top: 23.v, bottom: 5.v),
                              child: Row(children: [
                                Text("msg_already_have_an".tr,
                                    style: theme.textTheme.bodyMedium),
                                Container(
                                    height: 17.v,
                                    width: 42.h,
                                    margin: EdgeInsets.only(left: 6.h),
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                onTap: () =>
                                                    NavigatorService.goBack(),
                                                child: Text("lbl_log_in2".tr,
                                                    style: theme
                                                        .textTheme.titleSmall),
                                              )),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: 42.h,
                                                  child: Divider()))
                                        ]))
                              ])))
                    ])))));
  }

  /// Navigates to the profileScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the profileScreen.
  registerUser(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.profileScreen,
    );
  }
}
