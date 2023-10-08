// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Register widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RegisterEvent extends Equatable {}

/// Event that is dispatched when the Register widget is first created.
class RegisterInitialEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends RegisterEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends RegisterEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
