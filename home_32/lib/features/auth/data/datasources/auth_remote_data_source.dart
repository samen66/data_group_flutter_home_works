import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

/// Абстрактный источник данных для удаленной аутентификации
abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword(String email);

  Future<UserModel> signInWithGoogle();

  Stream<UserModel?> get authStateChanges;

  Future<UserModel?> getCurrentUser();
}

/// Реализация источника данных для удаленной аутентификации
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final firebase_auth.FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw const ServerException('User credential is null');
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw const ServerException('User credential is null');
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
    } catch (e) {
      throw ServerException('Failed to sign out: ${e.toString()}');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw const ServerException('Google sign in was cancelled');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken == null) {
        throw const ServerException('Failed to get Google ID token');
      }

      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw const ServerException('User credential is null');
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Google Sign-In error: ${e.toString()}');
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      }
      return UserModel.fromFirebaseUser(firebaseUser);
    });
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return null;
    }
    return UserModel.fromFirebaseUser(firebaseUser);
  }

  /// Маппинг Firebase Auth исключений в кастомные исключения
  AppException _mapFirebaseAuthException(firebase_auth.FirebaseAuthException e) {
    switch (e.code) {
      case 'wrong-password':
        return const ServerException('Неверный пароль');
      case 'user-not-found':
        return const ServerException('Пользователь не найден');
      case 'email-already-in-use':
        return const ServerException('Email уже используется');
      case 'weak-password':
        return const ServerException('Пароль слишком слабый');
      case 'invalid-email':
        return const ServerException('Неверный формат email');
      case 'user-disabled':
        return const ServerException('Пользователь заблокирован');
      case 'too-many-requests':
        return const ServerException('Слишком много запросов. Попробуйте позже');
      case 'operation-not-allowed':
        return const ServerException('Операция не разрешена. Проверьте настройки Google Sign-In в Firebase Console');
      case 'requires-recent-login':
        return const ServerException('Требуется повторный вход');
      case 'account-exists-with-different-credential':
        return const ServerException('Аккаунт с таким email уже существует');
      case 'invalid-credential':
        return const ServerException('Неверные учетные данные Google');
      case 'network-request-failed':
        return const ServerException('Ошибка сети. Проверьте подключение к интернету');
      default:
        return ServerException('Ошибка аутентификации: ${e.message ?? e.code}');
    }
  }
}
