part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersLoading extends UsersState {}

final class UserLoadedState extends UsersState {
  UserLoadedState(this.users);
  final List<User> users;
}

final class UsersLoadingFailed extends UsersState {
  UsersLoadingFailed(this.errorMessage);
  final String errorMessage;
}
