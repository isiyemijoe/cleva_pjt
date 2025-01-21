
part of 'users_bloc.dart';


@immutable
sealed class UsersState implements Equatable{
 const UsersState();
}

final class UsersLoading extends UsersState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

final class UserLoadedState extends UsersState {
  UserLoadedState(this.users);
  final List<User> users;

  @override
  List<Object?> get props => [users];

  @override
  bool? get stringify => false;
}

final class UsersLoadingFailed extends UsersState {
  UsersLoadingFailed(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  bool? get stringify => false;
}
