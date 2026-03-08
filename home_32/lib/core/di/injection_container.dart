import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
import '../../features/notes/data/datasources/notes_remote_data_source.dart';
import '../../features/notes/data/repositories/notes_repository_impl.dart';
import '../../features/notes/domain/repositories/notes_repository.dart';
import '../../features/notes/domain/usecases/create_note.dart';
import '../../features/notes/domain/usecases/update_note.dart';
import '../../features/notes/domain/usecases/delete_note.dart';
import '../../features/notes/domain/usecases/get_notes_stream.dart';
import '../../features/notes/domain/usecases/get_notes_paginated.dart';
import '../../features/notes/domain/usecases/search_notes.dart';
import '../../features/notes/domain/usecases/filter_notes.dart';
import '../../features/notes/presentation/bloc/notes_bloc.dart';
import '../../core/services/fcm_service.dart';
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart';
import '../../features/notifications/data/datasources/notifications_local_data_source.dart';
import '../../features/notifications/data/repositories/notifications_repository_impl.dart';
import '../../features/notifications/domain/repositories/notifications_repository.dart';
import '../../features/notifications/domain/usecases/get_device_token.dart';
import '../../features/notifications/domain/usecases/save_device_token.dart';
import '../../features/notifications/domain/usecases/update_device_token.dart';
import '../../features/notifications/domain/usecases/get_notification_settings.dart';
import '../../features/notifications/domain/usecases/update_notification_settings.dart';
import '../../features/notifications/presentation/bloc/notifications_bloc.dart';

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

  final firestore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => firestore);

  final firebaseMessaging = FirebaseMessaging.instance;
  getIt.registerLazySingleton(() => firebaseMessaging);

  final localNotifications = FlutterLocalNotificationsPlugin();
  getIt.registerLazySingleton(() => localNotifications);

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

  // Notes feature
  // Data sources
  getIt.registerLazySingleton<NotesRemoteDataSource>(
    () => NotesRemoteDataSourceImpl(
      firestore: getIt(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<NotesRepository>(
    () => NotesRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => CreateNote(getIt()));
  getIt.registerLazySingleton(() => UpdateNote(getIt()));
  getIt.registerLazySingleton(() => DeleteNote(getIt()));
  getIt.registerLazySingleton(() => GetNotesStream(getIt()));
  getIt.registerLazySingleton(() => GetNotesPaginated(getIt()));
  getIt.registerLazySingleton(() => SearchNotes(getIt()));
  getIt.registerLazySingleton(() => FilterNotes(getIt()));

  // Bloc
  getIt.registerFactory(
    () => NotesBloc(
      createNote: getIt(),
      updateNote: getIt(),
      deleteNote: getIt(),
      getNotesStream: getIt(),
      getNotesPaginated: getIt(),
      searchNotes: getIt(),
      filterNotes: getIt(),
      notesRepository: getIt(),
    ),
  );

  // Notifications feature
  // FCM Service
  getIt.registerLazySingleton<FCMService>(
    () => FCMService(
      firebaseMessaging: getIt(),
      localNotifications: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImpl(
      firestore: getIt(),
    ),
  );

  getIt.registerLazySingleton<NotificationsLocalDataSource>(
    () => NotificationsLocalDataSourceImpl(
      sharedPreferences: getIt(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetDeviceToken(getIt()));
  getIt.registerLazySingleton(() => SaveDeviceToken(getIt()));
  getIt.registerLazySingleton(() => UpdateDeviceToken(getIt()));
  getIt.registerLazySingleton(() => GetNotificationSettings(getIt()));
  getIt.registerLazySingleton(() => UpdateNotificationSettings(getIt()));

  // Bloc
  getIt.registerFactory(
    () => NotificationsBloc(
      getDeviceToken: getIt(),
      saveDeviceToken: getIt(),
      updateDeviceToken: getIt(),
      getNotificationSettings: getIt(),
      updateNotificationSettings: getIt(),
      firebaseMessaging: getIt(),
    ),
  );
}
