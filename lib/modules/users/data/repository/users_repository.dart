import 'package:cleva_pjt/modules/users/data/datasource/users_data_source.dart';
import 'package:cleva_pjt/modules/users/data/model/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}

class UsersRepositoryImpl implements UsersRepository {
  final UsersApiDataSource apiDataSource;

  UsersRepositoryImpl(this.apiDataSource);
  @override
  Future<List<User>> getUsers() {
    return apiDataSource.getUsers();
  }
}
