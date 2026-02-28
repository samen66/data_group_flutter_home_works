import 'package:equatable/equatable.dart';

/// Доменная сущность пользователя
class UserEntity extends Equatable {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;
  final bool emailVerified;

  const UserEntity({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
    this.emailVerified = false,
  });

  @override
  List<Object?> get props => [uid, email, displayName, photoURL, emailVerified];

  @override
  String toString() {
    return 'UserEntity(uid: $uid, email: $email, displayName: $displayName, emailVerified: $emailVerified)';
  }
}
