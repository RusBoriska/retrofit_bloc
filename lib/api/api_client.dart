import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;


  @GET("/users")
  Future<List<UserRequest>> getUsers();

  @GET("/posts")
  Future<List<PostRequest>> getPosts();

  @POST("/posts")
  Future<PostResponse> postDemo(@Body() PostRequest dataPost);
}