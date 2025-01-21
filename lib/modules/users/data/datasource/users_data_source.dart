import 'package:cleva_pjt/modules/users/data/model/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_data_source.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class UsersApiDataSource {
  factory UsersApiDataSource(Dio dio, {String baseUrl}) = _UsersApiDataSource;
  @GET('/users')
  Future<List<User>> getUsers();
}
