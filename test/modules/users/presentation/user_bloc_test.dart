import 'package:bloc_test/bloc_test.dart';
import 'package:cleva_pjt/modules/users/data/repository/users_repository.dart';
import 'package:cleva_pjt/modules/users/presentation/blocs/users_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cleva_pjt/modules/users/data/model/user.dart';

import 'users_block_test.mocks.dart';

@GenerateMocks([UsersRepository])
void main() {
  group('UsersBloc', () {
    late MockUsersRepository mockUsersRepository;
    late UsersBloc usersBloc;

    setUp(() {
      mockUsersRepository = MockUsersRepository();
      when(mockUsersRepository.getUsers()).thenAnswer(
        (_) async => [
          User(
              id: 1,
              name: 'Leanne Graham',
              username: 'Bret',
              email: 'joseph@gmail.com'),
        ],
      );
      usersBloc = UsersBloc(usersRepository: mockUsersRepository);
    });

    tearDown(() {
      usersBloc.close();
    });

    test('initial state is UsersLoading', () {
      expect(usersBloc.state.runtimeType, UsersLoading);
    });

    blocTest<UsersBloc, UsersState>(
      'emits [UsersLoading, UserLoadedState] when FetchUserEvent is added and users are fetched successfully',
      build: () {
        when(mockUsersRepository.getUsers()).thenAnswer(
          (_) async => [
            User(
                id: 1,
                name: 'Leanne Graham',
                username: 'Bret',
                email: 'joseph@gmail.com'),
          ],
        );
        return usersBloc;
      },
      act: (bloc) => bloc.add(FetchUserEvent()),
      expect: () => [
        isA<UsersLoading>(),
        isA<UserLoadedState>().having(
            (state) => state.users,
            'users',
            contains(
              isA<User>().having((user) => user.name, 'name', 'Leanne Graham'),
            ))
      ],
    );
  });
}
