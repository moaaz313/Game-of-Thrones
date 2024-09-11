// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'data/repositry/repo.dart';
import 'data/web_services/web_services.dart';
import 'logic/cubit/my_cubit.dart';

final getIt = GetIt.instance;

void getit() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<Repo>(() => Repo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));

  // todo => registerLazySingleton > This means it will be created only
  // when it's needed for the first time. 
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(seconds: 1000)
    ..options.receiveTimeout = const Duration(seconds: 1000);

  dio.interceptors.add(LogInterceptor(
    error: true,
    responseBody: true,
    requestHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
