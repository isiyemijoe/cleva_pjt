import 'package:cleva_pjt/_core_/di/di.dart';
import 'package:cleva_pjt/modules/users/data/model/user.dart';
import 'package:cleva_pjt/modules/users/data/repository/users_repository.dart';
import 'package:cleva_pjt/modules/users/presentation/blocs/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            UsersBloc(usersRepository: locator<UsersRepository>()),
        child: const UsersListView(),
      ),
    );
  }
}

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  Widget loadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget errorView(String message) {
    return Center(child: Text(message));
  }

  Widget usersList(List<User> users) {
    return ListView.separated(
        itemCount: users.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final user = users[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name ?? "",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "@${user.username}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider();
    },);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
      switch (state) {
        case UsersLoading():
          return loadingView();
        case UserLoadedState(users: List<User>? users):
          return usersList(users ?? []);
        case UsersLoadingFailed(errorMessage: String? message):
          return errorView(message);
      }
    });
  }
}
