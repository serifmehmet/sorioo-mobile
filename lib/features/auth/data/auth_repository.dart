import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_provider.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio client;

  AuthRepository({required this.client});
}

@riverpod
AuthRepository authRepositoryProvider(AuthRepositoryProviderRef ref) {
  return AuthRepository(client: ref.watch(dioProvider));
}
