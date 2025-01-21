import 'package:cleva_pjt/modules/users/data/datasource/users_data_source.dart';
import 'package:cleva_pjt/modules/users/data/repository/users_repository.dart';
import 'package:mockito/annotations.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cleva_pjt/modules/users/data/model/user.dart';

import 'users_repository_test.mocks.dart';

@GenerateMocks([UsersApiDataSource])
void main() {
  group('UsersRepositoryImpl', () {
    late MockUsersApiDataSource mockUsersApiDataSource;
    late UsersRepositoryImpl usersRepositoryImpl;

    setUp(() {
      mockUsersApiDataSource = MockUsersApiDataSource();
      usersRepositoryImpl = UsersRepositoryImpl(mockUsersApiDataSource);
    });

    test('should return a list of users when getUsers is called', () async {
      // Arrange
      final List<User> mockUserList =  [
        const User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz"),
        const User(id: 2, name: "Ervin Howell", username: "Antonette", email: "Shanna@melissa.tv"),
      ];

      when(mockUsersApiDataSource.getUsers()).thenAnswer((_) async => mockUserList);

      // Act
      final result = await usersRepositoryImpl.getUsers();

      // Assert
      expect(result, mockUserList);
      verify(mockUsersApiDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(mockUsersApiDataSource);
    });

    test('should throw an error when getUsers fails', () async {
      // Arrange
      when(mockUsersApiDataSource.getUsers()).thenThrow(Exception('Failed to load users'));

      // Act & Assert
      expect(() => usersRepositoryImpl.getUsers(), throwsException);
      verify(mockUsersApiDataSource.getUsers()).called(1);  // Verify if getUsers was called
      verifyNoMoreInteractions(mockUsersApiDataSource);  // Verify no other interactions
    });
  });
}