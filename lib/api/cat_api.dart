
import 'package:dreambit_test/repository/cats_data.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'cat_api.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/")
abstract class RestClient{
  factory RestClient(Dio dio) = _RestClient;


  @GET("/v1/breeds?api_key=12f180cf-0260-4f8f-b762-1753a0994168")
  Future<List<CatsInfo>> getCats();
}

