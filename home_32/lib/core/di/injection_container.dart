import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/sign_in_with_email.dart';
import '../../features/auth/domain/usecases/sign_up_with_email.dart';
import '../../features/auth/domain/usecases/sign_out.dart';
import '../../features/auth/domain/usecases/reset_password.dart';
import '../../features/auth/domain/usecases/sign_in_with_google.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

/// Инициализация dependency injection контейнера
Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  final firebaseAuth = firebase_auth.FirebaseAuth.instance;
  getIt.registerLazySingleton(() => firebaseAuth);

  final googleSignIn = GoogleSignIn();
  getIt.registerLazySingleton(() => googleSignIn);

  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: getIt(),
      googleSignIn: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: getIt(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => SignInWithEmail(getIt()));
  getIt.registerLazySingleton(() => SignUpWithEmail(getIt()));
  getIt.registerLazySingleton(() => SignOut(getIt()));
  getIt.registerLazySingleton(() => ResetPassword(getIt()));
  getIt.registerLazySingleton(() => SignInWithGoogle(getIt()));
  getIt.registerLazySingleton(() => GetCurrentUser(getIt()));

  // Bloc
  getIt.registerFactory(
    () => AuthBloc(
      signInWithEmail: getIt(),
      signUpWithEmail: getIt(),
      signOut: getIt(),
      resetPassword: getIt(),
      signInWithGoogle: getIt(),
      getCurrentUser: getIt(),
      authRepository: getIt(),
    ),
  );
}
