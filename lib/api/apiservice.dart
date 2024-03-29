import 'package:dio/dio.dart';
import 'package:rest_api_country_list/models/country.dart';
import 'package:retrofit/retrofit.dart';

part 'apiservice.g.dart';
@RestApi(baseUrl: 'https://restcountries.com/v2/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @GET('all')
  Future<List<Country>> getCountries();
}