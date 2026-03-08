import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/error/failures.dart';

/// Use case для получения device token
class GetDeviceToken {
  final FirebaseMessaging firebaseMessaging;

  GetDeviceToken(this.firebaseMessaging);

  Future<Either<Failure, String>> call() async {
    try {
      final token = await firebaseMessaging.getToken();
      if (token == null) {
        return const Left(ServerFailure('Failed to get device token'));
      }
      return Right(token);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
