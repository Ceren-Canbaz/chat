import 'package:chat/core/failures/failures.dart';
import 'package:chat/core/handlers/repository_executer.dart';
import 'package:chat/features/auth/data/auth_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signIn(
      {required String email, required String password});
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, UserCredential>> signUp(
      {required String email, required String password});
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _src;
  final RepositoryExecuter _repositoryExecuter = RepositoryExecuter();
  AuthRepositoryImpl({required AuthDataSource src}) : _src = src;
  @override
  Future<Either<Failure, UserCredential>> signIn(
      {required String email, required String password}) async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.signIn(email: email, password: password);
    });
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.logOut();
    });
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(
      {required String email, required String password}) async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.signUp(
        email: email,
        password: password,
      );
    });
  }
}
