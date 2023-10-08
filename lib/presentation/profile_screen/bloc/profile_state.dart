// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

/// Represents the state of Profile in the application.
class ProfileState extends Equatable {
  ProfileState({
    this.userName,
    this.email,
    this.gender,
    this.profileModelObj,
  });

  String? userName;

  String? email;

  String? gender;

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [
        userName,
        email,
        gender,
        profileModelObj,
      ];

  ProfileState copyWith({
    String? userName,
    String? email,
    String? gender,
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
