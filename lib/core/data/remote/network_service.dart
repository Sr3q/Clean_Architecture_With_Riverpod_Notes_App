import 'package:clean_note_app/core/data/remote/network_sevice_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: "http://127.0.0.1:8000/api/",
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );

  final dio = Dio(options);
  final networkServiceInterceptor =
      ref.watch(networkServiceInterceptorProvider);

  dio.interceptors.addAll([
    PrettyDioLogger(),
    networkServiceInterceptor,
  ]);

  return dio;
});
