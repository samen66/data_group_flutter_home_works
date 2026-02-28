import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../domain/entities/user_entity.dart';

/// Модель пользователя для data слоя
class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    super.email,
    super.displayName,
    super.photoURL,
    super.emailVerified,
  });

  /// Создание модели из Firebase User
  factory UserModel.fromFirebaseUser(firebase_auth.User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
      emailVerified: user.emailVerified,
    );
  }

  /// Преобразование в доменную сущность
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      displayName: displayName,
      photoURL: photoURL,
      emailVerified: emailVerified,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, displayName: $displayName, emailVerified: $emailVerified)';
  }
}
