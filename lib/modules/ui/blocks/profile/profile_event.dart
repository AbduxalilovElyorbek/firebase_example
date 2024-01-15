part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class EditUser extends ProfileEvent {
  final String userName;
  final String email;
  final String? number;
  final String? bio;
  const EditUser({
    required this.userName,
    required this.email,
    this.number,
    this.bio,
  });
}
