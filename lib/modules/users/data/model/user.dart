import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default(-1) int id,
    @Default("") String name,
    @Default("") String username,
    @Default("") String email,
    @Default(Address())Address address,
    @Default("") String phone,
    @Default("") String website,
    @Default(Company()) Company company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default("")  String street,
    @Default("")  String suite,
    @Default("")  String city,
    @Default("")  String zipcode,
    @Default(Geo())  Geo geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo {
  const factory Geo({
    @Default("")  String lat,
    @Default("")  String lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    @Default("")  String name,
    @Default("")  String catchPhrase,
    @Default("")  String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}