
import 'package:dio/dio.dart';
import 'package:hacker_news/network/NewsClient.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule{

  @lazySingleton
  NewsClient getNewsClient(Dio dio) => NewsClient(dio);

  @lazySingleton
  Dio provideDio(){
    var dio = Dio();
    print("Dio created");
    dio.options.headers["X-Api-Key"] = "e980bea76b474c068059ea0b22db5adb";
    return dio;
  }
}