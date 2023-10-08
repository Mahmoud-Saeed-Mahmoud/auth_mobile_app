import 'package:auth_mobile_app/core/app_export.dart';
import 'package:auth_mobile_app/core/utils/validation_functions.dart';
import 'package:auth_mobile_app/widgets/custom_elevated_button.dart';
import 'package:auth_mobile_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfileScreen());
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
                                    imagePath:
                                        ImageConstant.imgRectangle1136116x116,
                                    height: 116.adaptSize,
                                    width: 116.adaptSize,
                                    radius: BorderRadius.circular(8.h),
                                    alignment: Alignment.bottomCenter)
                              ])),
                      SizedBox(height: 24.v),
                      Text("lbl_ahmed_saber".tr,
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
                                BlocSelector<ProfileBloc, ProfileState,
                                        String?>(
                                    selector: (state) => state.userName,
                                    builder: (context, userNameController) {
                                      return CustomTextFormField(
                                          enabled: false,
                                          controller: TextEditingController()
                                            ..text = userNameController ?? "",
                                          hintText: "lbl_ahmed0saber".tr,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.h, vertical: 13.v));
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
                                BlocSelector<ProfileBloc, ProfileState,
                                        String?>(
                                    selector: (state) => state.email,
                                    builder: (context, emailController) {
                                      return CustomTextFormField(
                                          enabled: false,
                                          controller: TextEditingController()
                                            ..text = emailController ?? "",
                                          hintText:
                                              "msg_ahmed0saber33_gmail_com".tr,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidEmail(value,
                                                    isRequired: true))) {
                                              return "Please enter valid email";
                                            }
                                            return null;
                                          },
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.h, vertical: 13.v));
                                    })
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.h, top: 22.v, right: 24.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_gender".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray400),
                                SizedBox(height: 22.v),
                                BlocSelector<ProfileBloc, ProfileState,
                                        String?>(
                                    selector: (state) => state.gender,
                                    builder: (context, genderController) {
                                      return CustomTextFormField(
                                          enabled: false,
                                          controller: TextEditingController()
                                            ..text = genderController ?? "",
                                          hintText: "lbl_male".tr,
                                          textInputAction: TextInputAction.done,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 8.h, vertical: 13.v));
                                    })
                              ])),
                      CustomElevatedButton(
                          text: "lbl_log_out".tr,
                          margin: EdgeInsets.fromLTRB(24.h, 22.v, 24.h, 5.v),
                          buttonStyle:
                              CustomButtonStyles.fillSecondaryContainer,
                          onTap: () {
                            PrefUtils().clear();
                            logOut(context);
                          })
                    ])))));
  }

  /// Navigates to the logInScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the logInScreen.
  logOut(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.logInScreen,
    );
  }
}
