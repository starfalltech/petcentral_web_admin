
import 'package:petcentral_web_admin/core/platform/local_auth_storage/auth_storage.dart';
import 'package:petcentral_web_admin/core/platform/rest_client_service/rest_client_service.dart';
import 'package:petcentral_web_admin/features/auth/domain/entity/user_entity.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<bool> login(String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final RestClientService restClientService;

  AuthRemoteDataSourceImpl(this.restClientService);

  @override
  Future<bool> login(String email, String password) async {
    final fields = {
      'email': email,
      'password': password,
    };
    final response = await restClientService.login(fields);
    if (response.statusCode == 200) {
      final res = response.body as Map<String, dynamic>;
      final admin = UserEntity.fromJson(res);
      await AuthStorage().writeAuthStorage(
        'id',
        admin.id.toString(),
      );
      await AuthStorage().writeAuthStorage(
        'branchId',
        admin.branchId.toString(),
      );
      return true;
    } else {
      final err = response.error as Map<String, dynamic>;
      throw ServerException(err['message']);
    }
  }
}
