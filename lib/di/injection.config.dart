// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../network/NewsClient.dart' as _i4;
import '../repository/news_repository.dart' as _i5;
import '../repository/news_repository_impl.dart' as _i6;
import '../views/home/home_cubit.dart' as _i7;
import 'module/network_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Dio>(() => networkModule.provideDio());
  gh.lazySingleton<_i4.NewsClient>(
      () => networkModule.getNewsClient(get<_i3.Dio>()));
  gh.factory<_i5.NewsRepository>(
      () => _i6.NewsRepositoryImpl(get<_i4.NewsClient>()));
  gh.lazySingleton<_i7.HomeCubit>(
      () => _i7.HomeCubit(get<_i5.NewsRepository>()));
  return get;
}

class _$NetworkModule extends _i8.NetworkModule {}
