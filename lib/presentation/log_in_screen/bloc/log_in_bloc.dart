import 'dart:async';

import 'package:auth_mobile_app/data/models/loginDeviceAuth/post_login_device_auth_req.dart';
import 'package:auth_mobile_app/data/models/loginDeviceAuth/post_login_device_auth_resp.dart';
import 'package:auth_mobile_app/data/repository/repository.dart';
import 'package:auth_mobile_app/presentation/log_in_screen/models/log_in_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

/// A bloc that manages the state of a LogIn according to the event that is dispatched to it.
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(LogInState initialState) : super(initialState) {
    on<LogInInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<CreateLoginEvent>(_callLoginDeviceAuth);
  }

  final _repository = Repository();

  var postLoginDeviceAuthResp = PostLoginDeviceAuthResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LogInState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<LogInState> emit,
  ) {
    emit(state.copyWith(englishLabel: event.value));
  }

  _onInitialize(
    LogInInitialEvent event,
    Emitter<LogInState> emit,
  ) async {
    emit(state.copyWith(
        userNameController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true,
        englishLabel: false));
  }

  /// Calls [https://dummyjson.com/auth/login] with the provided event and emits the state.
  ///
  /// The [CreateLoginEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callLoginDeviceAuth(
    CreateLoginEvent event,
    Emitter<LogInState> emit,
  ) async {
    var postLoginDeviceAuthReq = PostLoginDeviceAuthReq(
      username: state.userNameController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );
    await _repository.loginDeviceAuth(
      headers: {
        'Content-Type': 'application/json',
      },
      requestData: postLoginDeviceAuthReq.toJson(),
    ).then((value) async {
      postLoginDeviceAuthResp = value;
      _onLoginDeviceAuthSuccess(state.englishLabel, value, emit);
      event.onCreateLoginEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onLoginDeviceAuthError();
      event.onCreateLoginEventError?.call();
    });
  }

  void _onLoginDeviceAuthSuccess(
    bool rememberMe,
    PostLoginDeviceAuthResp resp,
    Emitter<LogInState> emit,
  ) {
    PrefUtils().setRememberMe(rememberMe);
    PrefUtils().setUserName(resp.username ?? '');
    PrefUtils().setEmail(resp.email ?? '');
    PrefUtils().setGender(resp.gender ?? '');
    emit(
      state.copyWith(
        logInModelObj: state.logInModelObj?.copyWith(),
      ),
    );
  }

  void _onLoginDeviceAuthError() {
    //implement error method body...
  }
}
