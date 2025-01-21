part of 'users_bloc.dart';

@immutable
sealed class UsersEvent extends Equatable {}

class FetchUserEvent extends UsersEvent {
  @override
  List<Object?> get props => [];
}
