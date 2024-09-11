// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:game_of_thrones_app/constants/strings.dart';
import 'package:retrofit/retrofit.dart';

import '../models/model.dart';

//todo => This line indicates that this file is associated with a generated file named
part 'web_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('Characters')
  Future<List<Character>> getAllCharacters();
}
