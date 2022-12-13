import 'package:dartz/dartz.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';
import 'package:petcentral_web_admin/features/auth/data/datasouces/auth_remote_datasource.dart';
import 'package:petcentral_web_admin/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/exceptions.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async{
    try {
      final remoteGrooming = await remoteDataSource.login(email, password);
      return Right(remoteGrooming);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }
}
