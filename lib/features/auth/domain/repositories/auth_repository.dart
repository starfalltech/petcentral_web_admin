import 'package:dartz/dartz.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String email, String password);
}
