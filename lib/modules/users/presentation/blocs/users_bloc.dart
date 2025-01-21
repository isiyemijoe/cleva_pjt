import 'package:bloc/bloc.dart';
import 'package:cleva_pjt/modules/users/data/model/user.dart';
import 'package:cleva_pjt/modules/users/data/repository/users_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.usersRepository}) : super(UsersLoading()) {
    on<FetchUserEvent>((event, emit) async{
      await fetchUsers(emit);
    });
    add(FetchUserEvent());
  }
  final UsersRepository usersRepository;

  Future<void> fetchUsers(Emitter<UsersState> emit) async {
    emit(UsersLoading());
    final response = await usersRepository.getUsers().catchError((e, ex) {
      emit(UsersLoadingFailed(e.toString()));
    });

    emit(UserLoadedState(response));
  }
}
