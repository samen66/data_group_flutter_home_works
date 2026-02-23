import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../error/failures.dart';

abstract class SecureStorageService {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, Unit>> saveToken(String token);
  Future<Either<Failure, Unit>> deleteToken();
}

class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage _storage;
  static const String _tokenKey = 'auth_token';

  SecureStorageServiceImpl(this._storage);

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await _storage.read(key: _tokenKey);
      return Right(token);
    } catch (e) {
      return Left(StorageFailure('Failed to read token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
      return const Right(unit);
    } catch (e) {
      return Left(StorageFailure('Failed to save token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteToken() async {
    try {
      await _storage.delete(key: _tokenKey);
      return const Right(unit);
    } catch (e) {
      return Left(StorageFailure('Failed to delete token: ${e.toString()}'));
    }
  }
}
